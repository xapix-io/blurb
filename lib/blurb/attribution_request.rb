# frozen_string_literal: true

require 'blurb/request_collection'

class Blurb
  # Adapter ADS Attribution API
  class AttributionRequest < RequestCollection
    def initialize(headers:, base_url:, bulk_api_limit: 100)
      super
      @base_url = "#{base_url}/report"
    end

    # https://advertising.amazon.com/API/docs/en-us/amazon-attribution-prod-3p#tag/Reports/operation/getAttributionTagsByCampaign
    def report(start_date:, end_date:, report_type:, group_by:, metrics: nil, advertiser_ids: nil, cursor_id: nil, count: 5000) # rubocop:disable Metrics/ParameterLists, Metrics/MethodLength
      execute_request(
        request_type: :post,
        payload: {
          reportType: report_type,
          startDate: start_date,
          endDate: end_date,
          groupBy: group_by,
          cursorId: cursor_id,
          advertiserIds: advertiser_ids,
          metrics: metrics,
          count: count
        }.compact
      )
    end
  end
end
