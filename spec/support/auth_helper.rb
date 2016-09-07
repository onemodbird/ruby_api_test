module Appo
  module Test
    module AuthHelpers
      def mock_auth(provider, opts = {})
        auth_response = create(:auth_response)
        auth_response.provider = provider.downcase
        opts.each { |k, v| auth_response.send("#{k}=", v) }

        allow("Authentication::#{provider}".constantize)
          .to receive(:authenticate).and_return auth_response
      end
    end
  end
end
