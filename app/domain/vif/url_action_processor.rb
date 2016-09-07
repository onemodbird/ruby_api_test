module Vif
  class UrlActionProcessor
    PROCESSORS = [
      :error,
      :keep_original,
      :learning_product_swap,
      :link_to_home,
      :make_relative,
      :map_path_alias,
      :punt, # FIXME: need to remove this
      :remove_curriculum_map,
      :remove_element,
      :static_course_wheel,
      :static_map,
      :upload_and_swap,
    ]

    attr :content, :doc, :urls, :content_block

    @logger =
      ActiveSupport::Logger.new(
        Rails.root.join("log", "#{Rails.env}-UrlActionProcessor.log"))

    def self.logger
      @logger
    end

    def self.process(content, urls_with_actions, content_block = nil)
      new(content, urls_with_actions, content_block).process
    end

    def initialize(content, urls_with_actions, content_block = nil)
      @content = content
      @content_block = content_block
      @doc = Nokogiri::HTML.fragment(content)
      @urls = urls_with_actions.group_by(&:first)
    end

    def process
      PROCESSORS.each do |processor|
        urls.fetch(processor, []).each do |_, source, url|
          send(processor, source, url)
        end
      end

      doc.to_s
    end

    def error(source, url)
      log([ :error, source, url ])
    end

    def keep_original(source, url)
      log([ :keep_original, source, url ])
    end

    def learning_product_swap(source, url)
      k2_item_id = url[UrlActionMapper::LEARNING_PRODUCT_PATH, 1].to_i
      resource = Resource.find_by!(viflearn_k2_item_id: k2_item_id)

      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      change(:learning_product_swap, source, url, node) do
        node[attribute] = relative_url(resource.link)
      end
    rescue => e
      debug = {
        k2_item_id: k2_item_id,
        content_block_id: content_block.id,
        error_class: e.class.name,
        error_message: e.message}
      log([ :learning_product_swap_ERROR, source, url, debug ])
    end

    def link_to_home(source, url)
      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      change(:link_to_home, source, url, node) do
        node[attribute] = "/"
      end
    end

    def make_relative(source, url)
      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      change(:make_relative, source, url, node) do
        node[attribute] = relative_url(url)
      end
    end

    def map_path_alias(source, url)
      clean_url =
        url.sub(%r{\A/}, '').sub(%r{/\z}, '').sub(%r{\Aindex.php/}, '')

      k2_item_id = UrlActionMapper::PATH_ALIAS_LOOKUP.fetch(clean_url)
      resource = Resource.find_by!(viflearn_k2_item_id: k2_item_id)

      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      change(:map_path_alias, source, url, node) do
        node[attribute] = relative_url(resource.link)
      end
    end

    def punt(source, url)
      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      change(:punt, source, url, node) do
        node[attribute] = absolute_url(url)
      end
    rescue
      log([ :punt, source, url ])
    end

    def remove_curriculum_map(source, url)
      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      to_remove = node.parent
      to_remove = to_remove.parent if to_remove.name == "span"

      change(:remove_curriculum_map, source, url, to_remove.parent) do
        to_remove.remove
      end
    end

    def remove_element(source, url)
      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      change(:remove_element, source, url, node.parent) do
        node.remove
      end
    end

    def static_course_wheel(source, url)
      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      new_url = "https://dq117uwjefhd8.cloudfront.net/pd-course-wheel.png"

      change(:static_course_wheel, source, url, node) do
        node[attribute] = new_url
      end
    end

    def static_map(source, url)
      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      new_url =
        case node[attribute]
        when %r{my-pd} then "/assignments"
        when %r{mybadges} then "/users/me/badges"
        when %r{help/support} then "/contact"
        else raise "Missing static_map"
        end

      change(:static_map, source, url, node) do
        node[attribute] = new_url
      end
    end

    def upload_and_swap(source, url)
      element, attribute = source.split(".")
      node = doc.css(element).find { |n| n[attribute] == url }

      uploaded_file = UrlFileMover.move(node[attribute], content_block)

      change(:upload_and_swap, source, url, node) do
        node[attribute] = uploaded_file.url
      end
    rescue => e
      debug = {
        remote_url: absolute_url(url),
        content_block_id: content_block.id,
        error_class: e.class.name,
        error_message: e.message}
      log([ :upload_and_swap_ERROR, source, url, debug ])
    end

    private

    def log(array)
      if content_block
        info = {
          content_block_id: content_block.id,
          resource_id: content_block.resource_id
        }

        array[3] ||= {}
        array[3].merge!(info)
      end

      self.class.logger.info(array.inspect)
    end

    def change(action, source, url, node)
      from = node.to_s
      yield
      node.remove_attribute("target") unless action == :keep_original
      to = node.to_s
      log([ action, source, url, from: from, to: to ])
    end

    def relative_url(url)
      uri = Addressable::URI.parse(url)
      uri.host = nil
      uri.scheme = nil
      uri.to_s
    end

    def absolute_url(url)
      Vif.absolute_url(url)
    end
  end
end
