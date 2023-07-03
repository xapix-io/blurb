# frozen_string_literal: true

require 'blurb/request_collection'

class Blurb
  # Adapter for ADS SP v3 report requests
  class SpRequests < RequestCollection
    def targets_keywords_recommendations(asins:, recommendation_type:, max_recommendations:, bids_enabled:, sort_dimension:, marketplace_id:)
      headers = @headers.merge(
        'Content-Type' => 'application/vnd.spkeywordsrecommendation.v3+json',
        'Amazon-Advertising-API-MarketplaceId' => marketplace_id
      )
      execute_request(
        api_path: '/targets/keywords/recommendations',
        request_type: :post,
        headers: headers,
        payload: {
          asins: asins,
          recommendationType: recommendation_type,
          maxRecommendations: max_recommendations,
          bidsEnabled: bids_enabled,
          sortDimension: sort_dimension
        }
      )
    end
  end
end
