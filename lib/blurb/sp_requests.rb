# frozen_string_literal: true

require 'blurb/request_collection'

class Blurb
  # Adapter for ADS SP v3 report requests
  class SpRequests < RequestCollection
    def post(endpoint, payload)
      execute_request(
        api_path: endpoint,
        request_type: :post,
        payload: payload
      )
    end
  end
end
