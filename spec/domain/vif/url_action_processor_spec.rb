require "rails_helper"

module Vif
  describe UrlActionProcessor do
    let(:url) { Faker::Internet.url }
    let(:source) { "a.href" }
    let(:anchor) { %(<a href="#{url}">link</a>) }
    let(:image) { %(<img src="#{url}">) }
    let(:urls_with_actions) { [[ action, source, url ]] }

    def processed(content)
      UrlActionProcessor.process(content, urls_with_actions)
    end


    UrlActionMapper::ACTIONS.each do |action|
      it "handles action #{action.inspect}" do
        expect(UrlActionProcessor::PROCESSORS).to include(action)
        expect(UrlActionProcessor.new(nil, [])).to respond_to(action)
      end
    end


    describe "#error" do
      let(:action) { :error }

      it "logs the url for the error" do
        expect(UrlActionProcessor.logger)
          .to be_an_instance_of(ActiveSupport::Logger)

        expect(UrlActionProcessor.logger)
          .to receive(:info)
          .with(urls_with_actions.first.inspect)

        content = ""
        processed(content)
      end
    end

    describe "#keep_original" do
      let(:action) { :keep_original }

      it "leaves content unchanged" do
        content = "<p>#{anchor}</p>"
        expect(processed(content)).to eq(content)
      end
    end

    describe "#link_to_home" do
      let(:action) { :link_to_home }

      it "links to the home page" do
        content = anchor
        expect(processed(content)).to eq(anchor.sub(url, "/"))
      end
    end

    describe "#learning_product_swap" do
      let(:action) { :learning_product_swap }
<<<<<<< HEAD
      let(:resource) { create :resource, greenprintmedia_k2_item_id: rand(1..9999) }
      let(:url) { "vif-resource-library/item/#{resource.greenprintmedia_k2_item_id}" }
=======
      let(:resource) { create :resource, viflearn_k2_item_id: rand(1..9999) }
      let(:url) { "vif-resource-library/item/#{resource.viflearn_k2_item_id}" }
>>>>>>> parent of 0bd3464... customize to greenprintmedia

      it "maps a k2_item to the new resource learning_product" do
        content = anchor
        new_url = resource.link.sub(%r{\Ahttps://www.participate.com}, '')
        expected_content = anchor.sub(url, new_url)
        expect(processed(content)).to eq(expected_content)
      end
    end

    describe "#make_relative" do
      let(:action) { :make_relative }
      let(:url) { "https://www.participate.com/path/to/some/page" }

      it "makes links to participate.com relative links" do
        content = anchor
        expected_content = anchor.sub(url, "/path/to/some/page")
        expect(processed(content)).to eq(expected_content)
      end
    end

    describe "#map_path_alias" do
      let(:action) { :map_path_alias }
      let(:path_alias) { UrlActionMapper::PATH_ALIAS_LOOKUP.first }
      let(:resource) { create :resource, viflearn_k2_item_id: path_alias.last }
      let(:url) { "index.php/#{path_alias.first}" }

      it "maps an k2 alias to a resource" do
        content = anchor
        new_url = resource.link.sub(%r{\Ahttps://www.participate.com}, '')
        expected_content = anchor.sub(url, new_url)
        expect(processed(content)).to eq(expected_content)
      end
    end

    describe "#punt" do
      let(:action) { :punt }

<<<<<<< HEAD
      {                          "page" => "https://www.greenprintmedia.org/page",
                                "/page" => "https://www.greenprintmedia.org/page",
              "//www.greenprintmedia.org/page" => "https://www.greenprintmedia.org/page",
         "http://www.greenprintmedia.org/page" => "http://www.greenprintmedia.org/page",
        "https://www.greenprintmedia.org/page" => "https://www.greenprintmedia.org/page",
=======
      {                          "page" => "https://www.viflearn.com/page",
                                "/page" => "https://www.viflearn.com/page",
              "//www.viflearn.com/page" => "https://www.viflearn.com/page",
         "http://www.viflearn.com/page" => "http://www.viflearn.com/page",
        "https://www.viflearn.com/page" => "https://www.viflearn.com/page",
>>>>>>> parent of 0bd3464... customize to greenprintmedia
      }.each do |old_url, new_url|

        describe "maps #{old_url}" do
          let(:url) { old_url }

          it "-> #{new_url}" do
            content = anchor
            expect(processed(content)).to eq(%(<a href="#{new_url}">link</a>))
          end
        end
      end
    end

    describe "#remove_curriculum_map" do
      let(:action) { :remove_curriculum_map }

      it "removes the link and the parent element" do
        content = "<div><p>#{anchor}</p></div>"
        expect(processed(content)).to eq("<div></div>")
      end

      it "removes the link and the grandparent when parent == span" do
        content = "<div><p><span>#{anchor}</span></p></div>"
        expect(processed(content)).to eq("<div></div>")
      end
    end

    describe "#remove_element" do
      let(:action) { :remove_element }

      it "removes the link" do
        content = "<p>#{anchor}</p>"
        expect(processed(content)).to eq("<p></p>")
      end
    end

    describe "#static_course_wheel" do
      let(:action) { :static_course_wheel }
      let(:source) { "img.src" }

      it "uses the new image url" do
        content = image
        new_url = "https://dq117uwjefhd8.cloudfront.net/pd-course-wheel.png"
        expect(processed(content)).to eq(%(<img src="#{new_url}">))
      end
    end

    describe "#static_map" do
      let(:action) { :static_map }

      { "mybadges" => "/users/me/badges",
        "my-pd/latest" => "/assignments",
        "help/support" => "/contact"
      }.each do |old_url, new_url|

        describe "maps #{old_url}" do
          let(:url) { old_url }

          it "-> #{new_url}" do
            content = anchor
            expect(processed(content)).to eq(%(<a href="#{new_url}">link</a>))
          end
        end
      end
    end

    describe "#upload_and_swap" do
      let(:action) { :upload_and_swap }
      let(:new_url) { Faker::Internet.url }
      let(:uploaded_file) { instance_double("UploadedFile", url: new_url) }

      it "replaces the a.href url with that of the uploaded file" do
        content = anchor
        expect(UrlFileMover).to receive(:move).and_return(uploaded_file)
        expect(processed(content)).to eq(%(<a href="#{new_url}">link</a>))
      end

      describe "img.src" do
        let(:source) { "img.src" }

        it "replaces the img.src url with that of the uploaded file" do
          content = image
          expect(UrlFileMover).to receive(:move).and_return(uploaded_file)
          expect(processed(content)).to eq(%(<img src="#{new_url}">))
        end
      end
    end

  end
end
