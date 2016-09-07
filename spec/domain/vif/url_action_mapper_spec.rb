require "spec_helper"

module Vif
  describe UrlActionMapper do
    VIFLEARN = %r{
      \A
      (?:https?://(www\.)?viflearn\.com)?
      /?
      (?:index\.php/)?
    }x

    PATH_ALIAS_LOOKUP =
      JSON.parse(File.read("db/path_to_k2_item_id_map.json"))

    let(:curriculum_map_ids) { [19299, 10533, 10534, 10536, 10537, 29641] }

    it "requires actions to be defined" do
      url_action_map = UrlActionMapper.new("a.href", "images/i.gif")

      expect(url_action_map)
        .to receive(:choose_action)
        .and_return(:bogus_action)

      expect { url_action_map.map }.to raise_error("Invalid Action")
    end

    url_examples =
      begin
        data_file = Rails.root.join("spec/fixtures/url_action_map.json")
        JSON.parse(File.read(data_file))
      end


    url_examples.each do |url_info|
      it "maps #{url_info.inspect}" do
        action, attribute, url = UrlActionMapper.new(*url_info).map
        uri = Addressable::URI.parse(url)

        expect(action).to_not eq(nil)
        expect(action).to_not eq(:error)

        if attribute == "script.src" && url =~ %r{//www.google.com/jsapi|//cdnapisec.kaltura.com/}
          expect(action).to eq(:keep_original)
        end

        if attribute == "iframe.src"
          expect(action).to eq(:keep_original)
        end

        if url =~ %r{\A#}
          expect(action).to eq(:keep_original)
        end

        if url =~ %r{#{VIFLEARN}\z}
          expect(action).to eq(:link_to_home)
<<<<<<< HEAD
        elsif url =~ %r{https?://(www\.)?greenprint\.com/}
=======
        elsif url =~ %r{https?://(www\.)?participate\.com/}
>>>>>>> parent of 0bd3464... customize to greenprintmedia
          expect(action).to eq(:make_relative)
        elsif url =~ %r{\Ahttps?://} && !(url =~ %r{https?://(www\.)?viflearn\.com/})
          expect(action).to eq(:keep_original)
        end

        if %w(
<<<<<<< HEAD
              https://www.greenprintmedia.org/index.php/my-pd/latest
=======
              https://www.viflearn.com/index.php/my-pd/latest
>>>>>>> parent of 0bd3464... customize to greenprintmedia
              /index.php/mybadges
              /index.php/mybadges/view/form
              /mybadges/
          ).include?(url)

          expect(action).to eq(:static_map)
        end

        if attribute == "img.src"
          if url =~ %r{\Afile://}
            expect(action).to eq(:remove_element)
          end

          if url =~ %r{\Ahttps?://} && !(url =~ %r{https?://(www\.)?viflearn\.com})
            expect(action).to eq(:keep_original)
          end

          if url =~ %r{/pd-course-wheel\.png(\z|\?)}
            expect(action).to eq(:static_course_wheel)
          elsif url =~ %r{
              \A
              (https?://(www\.)?viflearn\.com/|/)?
              (?: images/
                | badges/images/
                | media/k2/items/cache/
              )
            }x

            expect(action).to eq(:upload_and_swap)
          end
        end

        if attribute == "a.href"
          if url =~ /\Amailto:/
            expect(action).to eq(:keep_original)
          end

          if url =~ %r{
              \A
              (?:https?://(www\.)?viflearn\.com/|/)?
              (?:index\.php/)?
              (?: component/k2/item/19299
                | conexiones-1-3-curriculum-map
                | connections-curriculum-map
                | dual-language-k-5-curriculum-map
                | vif-resource-library/item/10533-connectionsi-coursecurriculum
                | vif-resource-library/item/10534-curriculummap-connectionsii
                | vif-resource-library/item/10536-curriculummap-connectionsiii
                | vif-resource-library/item/10537-curriculummap-connectionsiv
                | vif-resource-library/item/29641-curriculummap-conexionesiii
              )
            }x || curriculum_map_ids.include?(
                    url[Vif::UrlActionMapper::LEARNING_PRODUCT_PATH, 1].to_i)

            expect(action).to eq(:remove_curriculum_map)

          elsif url =~ VIFLEARN &&
            PATH_ALIAS_LOOKUP.key?(uri.path.sub(%r{\A(?:/|/?index\.php/)}, ''))

            expect(action).to eq(:map_path_alias)
          end

          if url =~ %r{
              \A
              (https?://(www\.)?viflearn\.com/|/)?
              (?: images/
              )
            }x

            expect(action).to eq(:upload_and_swap)
          end
        end

      end
    end
  end
end
