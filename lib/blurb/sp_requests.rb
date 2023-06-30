# frozen_string_literal: true

require 'blurb/request_collection'

class Blurb
  # Adapter for ADS SP v3 report requests
  class SpRequests < RequestCollection
    def targets_keywords_recommendations(payload)
      headers = @headers.merge('Content-Type' => 'application/vnd.spkeywordsrecommendation.v3+json')
      execute_request(
        api_path: '/targets/keywords/recommendations',
        request_type: :post,
        payload: payload,
        headers: headers
      )
    end
  end
end
