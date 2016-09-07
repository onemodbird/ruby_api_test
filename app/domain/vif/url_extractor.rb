module Vif
  module UrlExtractor
    module_function

    def extract(html)
      extracted = []

      Nokogiri::HTML.parse(html).xpath("//*[@src|@href]").each do |node|
        if node.key?("src")
          extracted << [ "#{node.name}.src", node["src"] ]
        end
        if node.key?("href")
          extracted << [ "#{node.name}.href", node["href"] ]
        end
      end

      extracted
    end
  end
end
