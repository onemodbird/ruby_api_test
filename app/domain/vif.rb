module Vif
  module_function

  def extract_urls(html)
    UrlExtractor.extract(html)
  end

  def modify_content(content, content_block = nil)
    if content_block.resource.kind == "course"
      content = relink_discussions(content)
    end

    content = relink_download_pdfs(content, content_block)
    content = strip_style_attributes(content) rescue content
    content = odds_and_ends(content, content_block)

    urls_with_source = Vif::UrlExtractor.extract(content)
    urls_with_actions = Vif::UrlActionMapper.map(urls_with_source)
    Vif::UrlActionProcessor.process(content, urls_with_actions, content_block)
  end

  def odds_and_ends(content, content_block)
    resource = content_block.resource

    if resource.viflearn_k2_item_id == 43089
      doc = Nokogiri::HTML.fragment(content)
      doc.css("div.objectives").remove_attr("class")
      doc.to_s
    else
      content
    end
  end

  def strip_style_attributes(content)
    doc = Nokogiri::HTML.fragment(content)
    doc.css("*:not(img)").remove_attr("style")
    doc.to_s
  end

  def relink_download_pdfs(content, content_block)
    fragment = Nokogiri::HTML.fragment(content)

    fragment.css("a").each do |a|
      if a["href"].present? && a.text =~ /download\s+pdf/i
        uploaded_file = nil

        ContentBlock.transaction do
          uploaded_file = UrlFileMover.move(a["href"], content_block)

          existing_content_block =
            content_block.resource.content_blocks.find do |block|
              block.kind == "file" &&
                block.uploaded_file_id == uploaded_file.id
            end

          if existing_content_block.nil?
            content_block.resource.content_blocks.create!(
              kind: "file",
              uploaded_file: uploaded_file
            )
          end
        end

        a.remove if uploaded_file
      end
    end

    fragment.to_s
  end

  def is_discussion_url?(url)
    url.match(/\/jomsocial\//) ||
    url.match(/\/community\//) ||
    url.match(/\/viewdiscussion\//)
  end

  def relink_discussions(content)
    fragment = Nokogiri::HTML.fragment(content)

    fragment.css("a").each do |anchor|
      if anchor["href"].present? && is_discussion_url?(anchor["href"])
        anchor["href"] = "#discussion"
        anchor.remove_attribute("target")
      end
    end

    fragment.to_s
  end

  def absolute_url(url)
    uri = Addressable::URI.parse(url)
    uri.path = "/" + uri.path unless uri.path.start_with?("/")
    uri.scheme = "https" if uri.scheme.blank?
<<<<<<< HEAD
    uri.host = "www.greenprintmedia.org" if uri.host.blank?
=======
    uri.host = "www.viflearn.com" if uri.host.blank?
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    uri.to_s
  end
end
