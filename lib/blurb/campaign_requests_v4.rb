require 'blurb/request_collection_with_campaign_type'

class Blurb
  class CampaignRequestsV4 < RequestCollectionWithCampaignType
    def initialize(campaign_type:, resource:, base_url:, headers:, bulk_api_limit: 100)
      super
      @base_url = "#{base_url}/#{campaign_type}/v4/#{resource}"
    end

    def list(url_params = nil)
      execute_request(
        api_path: '/list',
        request_type: :post,
        url_params: url_params,
        headers: @headers.merge('Accept' => 'application/vnd.sbcampaignresource.v4+json')
      )
    end
  end
end
