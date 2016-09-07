module Appo
  module Test
    module ApiHelpers
      def api_post(url, user_or_auth_token, params = {})
        post authenticated_url(url, user_or_auth_token), params
      end

      def api_put(url, user_or_auth_token, params = {})
        put authenticated_url(url, user_or_auth_token), params
      end

      def api_get(url, user_or_auth_token, params = {})
        get authenticated_url(url, user_or_auth_token), params
      end

      def api_delete(url, user_or_auth_token, params = {})
        delete authenticated_url(url, user_or_auth_token), params
      end

      def authenticated_url(url, user_or_auth_token)
        auth_token = user_or_auth_token.try(:auth_token) || user_or_auth_token

        Addressable::URI.parse(url).tap do |addressable|
          addressable.query_values =
            (addressable.query_values || {}).merge(auth_token: auth_token)
        end.to_s
      end

      def json_response
        return @json_response if @json_response
        json_response!
      end

      def json_response!
        begin
          @json_response = JSON.parse(response.body)
        rescue
          raise "Failed to parse JSON from body: #{response.body}"
        end
      end

      def expect_response_code_of(code)
        expect(response.status).to eq(code)
      end

      def expect_response_content_type(type)
        expect(response.content_type.to_s).to eq(type)
      end
    end
  end
end
