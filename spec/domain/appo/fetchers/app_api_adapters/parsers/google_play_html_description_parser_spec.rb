require "rails_helper"
require "appo/fetchers/app_api_adapters/parsers/google_play_html_description_parser"

describe GooglePlayHtmlDescriptionParser do
  let(:parser) { GooglePlayHtmlDescriptionParser }

  it "handles plain text" do
    expect(parser.parse("Hi there!")).to eq("Hi there!")
  end

  describe "html tags" do
    it "ignores a" do
      html = %(Just <a href="http://bit.ly/x">a</a> link)
      expect(parser.parse(html)).to eq("Just a link")
    end

    it "ignores b" do
      html = %(<b>Be BOLD!</b>)
      expect(parser.parse(html)).to eq("Be BOLD!")
    end

    it "adds a newline for br" do
      html = %(line1<br>line2)
      expect(parser.parse(html)).to eq("line1\nline2")
    end

    it "ignores div" do
      html = %(<div>divs</div> <div>just</div> <div>disappear</div>)
      expect(parser.parse(html)).to eq("divs just disappear")
    end

    it "wraps p in newlines" do
      html = %(line1<p>line2</p>line3)
      expect(parser.parse(html)).to eq("line1\nline2\nline3")
    end

    it "prevents 3+ consecutive newlines" do
      html = %(line1<br><br><br>line2)
      expect(parser.parse(html)).to eq("line1\n\nline2")
    end

    it "prevents leading/trailing whitespace" do
      html = %( <p>\n\t\n HI \n\r\t <br><br></p>)
      expect(parser.parse(html)).to eq("HI")
    end
  end
end
