module GooglePlayHtmlDescriptionParser
  module_function

  def parse(node)
    parse_node(node)
      .flatten
      .join
      .gsub(/\n{3,}/, "\n\n")
      .strip
  end

  def parse_node(node)
    case node
    when String then parse_node(Nokogiri::HTML.fragment(node))
    when Nokogiri::HTML::DocumentFragment then parse_child_nodes(node)
    when Nokogiri::XML::Element then parse_node_by_name(node)
    when Nokogiri::XML::Text then [node.text]
    else raise "Unhandled Node Type: #{node.class}"
    end
  end

  def parse_node_by_name(node)
    case node.name
    when "a", "b", "div" then parse_child_nodes(node)
    when "br" then [ "\n", parse_child_nodes(node) ]
    when "p" then [ "\n", parse_child_nodes(node), "\n" ]
    else raise "Unhandled Node Name: #{node.name}"
    end
  end

  def parse_child_nodes(node)
    node.children.map do |child_node|
      parse_node(child_node)
    end
  end
end
