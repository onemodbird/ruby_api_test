require "rails_helper"

module Appo
  module Fetchers
    describe Webpage do
      def mock_response(code, body = nil, path = nil, headers = {})
        body ||= %[
            <html>
              <head>
                <title>Title</title>
                <meta property="og:title" content="Title" />
              </head>
            </html>
          ]

        stub_request(:get, url(path))
          .to_return(status: code, body: body, headers: {})
      end

      def webpage(path = nil)
        Webpage.new(url(path))
      end

      def url(path = nil)
        ["http://cdn.example.com", path].compact.join("/")
      end

      describe "#description" do
        it "extracts from <og:description> if present" do
          mock_response(200, %[
            <html>
              <head>
                <title>Title</title>
                <meta property="og:description" content="description" />
              </head>
            </html>
          ])

          expect(webpage.description).to eq "description"
        end

        it "sanitizes html descriptions" do
          mock_response(200, %[
            <html>
              <head>
                <title>Title</title>
                <meta property="og:description" content="<p><b>I'm bold</b><br/><br/></p> I'm normal" />
              </head>
            </html>
          ])

          expect(webpage.description).to eq "I'm bold I'm normal"
        end

        it "sanitizes non utf-8 encoding" do
          mock_response(200, %[
            <html>
              <head>
                <title>Title</title>
                <meta property="og:description" content="Thing1 --\xA0 Thing2" />
              </head>
            </html>
          ])

          expect(webpage.description).to eq("Thing1 -- Thing2")
        end
      end

      describe "#name" do
        it "extracts from <og:title> if present" do
          mock_response(200)
          expect(webpage.name).to eq("Title")
        end

        it "extracts from <title> if <og:title> content is empty" do
          mock_response(200, %[
            <html>
              <head>
                <title>Title</title>
                <meta property="og:title" content=" " />
              </head>
            </html>
          ])
          expect(webpage.name).to eq("Title")
        end

        it "extracts from <title> if <og:title> has no content attribute" do
          mock_response(200, %[
            <html>
              <head>
                <title>Title</title>
                <meta property="og:title" />
              </head>
            </html>
          ])
          expect(webpage.name).to eq("Title")
        end

        it "extracts from <title> if <og:title> not present" do
          mock_response(200, %[
            <html>
              <head>
                <title>Title</title>
              </head>
            </html>
          ])
          expect(webpage.name).to eq("Title")
        end

        it "sanitizes non utf-8 encoding" do
          mock_response(200, %[
            <html>
              <head>
                <title>Thing1 --\xA0 Thing2</title>
              </head>
            </html>
          ])

          expect(webpage.name).to eq("Thing1 -- Thing2")
        end

        describe "name from filename" do
          %w(.doc .docx .xls .xlsx .ppt .pptx .pdf).each do |ext|
            it "uses the filename for #{ext} if no title in HTML" do
              filename = "file#{ext}?x=1"

              mock_response(200, %[], filename)
              expect(webpage(filename).name).to eq("file#{ext}")
            end
          end

          it "decodes the filename" do
            filename = "my%20pdf%20doc.pdf?x=1"
            mock_response(200, %[], filename)
            expect(webpage(filename).name).to eq("my pdf doc.pdf")
          end
        end

        it "defaults to the url if a title cannot otherwise be found" do
          mock_response(200, %[])
          expect(webpage.name).to eq(url)
        end
      end

      describe "#image_url" do
        let(:image) { "http://cdn.example.com/thing.jpg" }
        def body_for_head(head_content)
          %[
            <html>
              <head>
                <title>Title</title>
                #{head_content}
              </head>
            </html>
          ]
        end

        it "uses a fallback if no image detected" do
          mock_response(200)

          expect(webpage.image_url).to eq("https://cdn.example.com/chrome/icons/web05.png")
        end

        it "uses a fallback if og:image is blank" do
          body = body_for_head("<meta property='og:image' content='  '/>")
          mock_response(200, body)

          expect(webpage.image_url).to eq("https://cdn.example.com/chrome/icons/web05.png")
        end

        it "uses a fallback if og:image is not a relative url starting with a slash" do
          body = body_for_head("<meta property='og:image' content='garbage/is/as/garbage/does'/>")
          mock_response(200, body)

          expect(webpage.image_url).to eq("https://cdn.example.com/chrome/icons/web05.png")
        end

        it "uses og:image if available" do
          body = body_for_head("<meta property='og:image' content='#{image}'/>")
          mock_response(200, body)

          expect(webpage.image_url).to eq(image)
        end

        it "uses a og:image if a relative url preceeded by a slash" do
          body = body_for_head("<meta property='og:image' content='/notgarbage/atall.jpg'/>")
          mock_response(200, body)

          expect(webpage.image_url).to eq("http://cdn.example.com/notgarbage/atall.jpg")
        end

        it "uses og:image above all other methods" do
          body = body_for_head(%[
            <link href='garbage1.jpg' rel='apple-touch-icon' sizes='120x120' type='image/png'>
            <meta name='twitter:image' content='garbage2.jpg'/>"
            <meta property='og:image' content='#{image}'/>
            %])
          mock_response(200, body)

          expect(webpage.image_url).to eq(image)
        end

        it "uses twitter:image if available" do
          body = body_for_head("<meta name='twitter:image' content='#{image}'/>")
          mock_response(200, body)

          expect(webpage.image_url).to eq(image)
        end

        it "uses largest apple touch icon if available" do
          body = body_for_head(%[
            <link href='#{image}1' rel='apple-touch-icon' sizes='120x120' type='image/png'>
            <link href='#{image}2' rel='apple-touch-icon' sizes='152x152' type='image/png'>
            %])
          mock_response(200, body)

          expect(webpage.image_url).to eq("#{image}2")
        end

        it "uses largest precomposed apple touch icon if available" do
          body = body_for_head(%[
            <link href='#{image}1' rel='apple-touch-icon-precomposed' sizes='120x120' type='image/png'>
            <link href='#{image}2' rel='apple-touch-icon-precomposed' sizes='152x152' type='image/png'>
            %])
          mock_response(200, body)

          expect(webpage.image_url).to eq("#{image}2")
        end

      end
    end
  end
end

