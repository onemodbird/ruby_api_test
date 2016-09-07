module Vif
  class UrlActionMapper
    ACTIONS = [
      :error,
      :keep_original,
      :learning_product_swap,
      :link_to_home,
      :make_relative,
      :map_path_alias,
      :punt,
      :remove_curriculum_map,
      :remove_element,
      :static_course_wheel,
      :static_map,
      :upload_and_swap,
    ]

<<<<<<< HEAD
    greenprintmedia_DOMAIN = /\A(?:www\.)?greenprintmedia\.com\z/
    greenprint_DOMAIN = /\A(?:www\.)?greenprint\.com\z/
=======
    VIFLEARN_DOMAIN = /\A(?:www\.)?viflearn\.com\z/
    PARTICIPATE_DOMAIN = /\A(?:www\.)?participate\.com\z/
>>>>>>> parent of 0bd3464... customize to greenprintmedia

    COURSE_WHEEL_PATH = %r{
      \A/?images/
      (?: pd/PD-icons/
        | main/theoretical/
        | main/home/training/
      )
      pd-course-wheel\.png
      \z
    }x

    DOC_PATH = %r{\A/?docs/}

    IMAGE_PATH = %r{\A/?images/}

    BADGE_IMAGE_PATH = %r{\A/?badges/images/}

    MEDIA_K2_ITEMS_CACHE_PATH = %r{\A/?media/k2/items/cache/}

    CURRICULUM_MAP_PATH = %r{
      \A
      /?
      (?:index\.php/)?
      (?: conexiones-1-3-curriculum-map
        | connections-curriculum-map
        | dual-language-k-5-curriculum-map
      )
    }x

    LEARNING_PRODUCT_PATH = %r{
      \A
      /?
      (?:index\.php/)?
      (?: (?:vif-)?resource-library
        | component/k2
      )
      /item/(\d+)
    }x

    MY_BADGES_PATH = %r{
      \A
      /?
      (?:index\.php/)?
      mybadges
    }x

    MY_PD_PATH = %r{
      \A
      /?
      (?:index\.php/)?
      my-pd/latest
    }x


    PATH_ALIAS_LOOKUP =
      JSON.parse(File.read("db/path_to_k2_item_id_map.json"))

    attr :source, :url, :uri

    def self.map(urls_with_source)
      urls_with_source.map { |u| new(*u).map }
    end

    def initialize(source, url)
      @source = source
      @url = url
      @uri = Addressable::URI.parse(url) rescue nil
    end

    def map
      action = uri.nil? ? :error : choose_action
      action = :punt if action.nil?

      raise "Invalid Action" unless ACTIONS.include?(action)

      [ action, source, url ]
    end

    def choose_action
      if script? && offsite? && google_jsapi?
        :keep_original
      elsif script? && offsite? && kaltura?
        :keep_original
      elsif iframe? && http? && offsite?
        :keep_original
      elsif img? && file?
        :remove_element
      elsif img? && http? && offsite?
        :keep_original
      elsif img? && http? && onsite? && course_wheel?
        :static_course_wheel
      elsif img? && http? && onsite? && images_path?
        :upload_and_swap
      elsif img? && http? && onsite? && badge_images_path?
        :upload_and_swap
      elsif img? && http? && onsite? && media_k2_items_cache_path?
        :upload_and_swap
      elsif img? && http? && onsite? && img_named_path?
        :upload_and_swap
      elsif a? && mailto?
        :keep_original
<<<<<<< HEAD
      elsif a? && http? && greenprint?
=======
      elsif a? && http? && participate?
>>>>>>> parent of 0bd3464... customize to greenprintmedia
        :make_relative
      elsif a? && http? && offsite?
        :keep_original
      elsif a? && http? && onsite? && empty_path? && fragment?
        :keep_original
      elsif a? && http? && onsite? && (home_path? || empty_path?) && !fragment?
        :link_to_home
      elsif a? && http? && onsite? && images_path?
        :upload_and_swap
      elsif a? && http? && onsite? && docs_path?
        :upload_and_swap
      elsif a? && http? && onsite? && media_k2_items_cache_path?
        :upload_and_swap
      elsif a? && http? && onsite? && static_path?
        :static_map
      elsif a? && http? && onsite? && curriculum_map?
        :remove_curriculum_map
      elsif a? && http? && onsite? && path_alias?
        :map_path_alias
      elsif a? && http? && onsite? && learning_product_path?
        :learning_product_swap
      end
    end

    def a?
      source == "a.href"
    end

    def img?
      source == "img.src"
    end

    def script?
      source == "script.src"
    end

    def iframe?
      source == "iframe.src"
    end

    def mailto?
      uri.scheme == "mailto"
    end

    def file?
      uri.scheme == "file"
    end

    def http?
      [nil, "http", "https"].include?(uri.scheme)
    end

    def offsite?
      !onsite?
    end

    def onsite?
      uri.host.nil? || uri.host.match(VIFLEARN_DOMAIN)
    end

<<<<<<< HEAD
    def greenprint?
      uri.host && uri.host.match(greenprint_DOMAIN)
=======
    def participate?
      uri.host && uri.host.match(PARTICIPATE_DOMAIN)
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    end

    def empty_path?
      uri.path.blank?
    end

    def home_path?
      uri.path == "/"
    end

    def fragment?
      !uri.fragment.nil?
    end

    def images_path?
      !!uri.path.match(IMAGE_PATH)
    end

    def docs_path?
      !!uri.path.match(DOC_PATH)
    end

    def badge_images_path?
      !!uri.path.match(BADGE_IMAGE_PATH)
    end

    def media_k2_items_cache_path?
      !!uri.path.match(MEDIA_K2_ITEMS_CACHE_PATH)
    end

    def learning_product_path?
      !!uri.path.match(LEARNING_PRODUCT_PATH)
    end

    def static_path?
      my_badges_path? || my_pd_path?
    end

    def my_badges_path?
      !!uri.path.match(MY_BADGES_PATH)
    end

    def my_pd_path?
      !!uri.path.match(MY_PD_PATH)
    end

    def curriculum_map?
      id = uri.path[LEARNING_PRODUCT_PATH, 1].to_i

      curriculum_map_ids.include?(id) ||
        uri.path.match(CURRICULUM_MAP_PATH)
    end

    def curriculum_map_ids
      [19299, 10533, 10534, 10536, 10537, 29641]
    end

    def img_named_path?
      ["/main/home/eoy/photo2-01.png"].include?(uri.path)
    end

    def course_wheel?
      !!uri.path.match(COURSE_WHEEL_PATH)
    end

    def google_jsapi?
      uri.host == "www.google.com" && uri.path == "/jsapi"
    end

    def kaltura?
      uri.host == "cdnapisec.kaltura.com"
    end

    def path_alias?
      clean_path = uri.path.to_s.gsub(%r{\A/|index\.php/|/\z}, '')
      PATH_ALIAS_LOOKUP.key?(clean_path)
    end

  end
end
