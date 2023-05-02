module EskomSePush
  class Client < ApiPattern::Client
    include ::EskomSePush::Constants

    attr_reader :token, :base_path, :port

    def initialize(token:, base_path: BASE_URI, port: BASE_PORT, content_type: CONTENT_TYPE)
      super(token: token, base_path: base_path, port: port, content_type: content_type)
    end

    def self.compatible_api_version
      'v2'
    end

    # This is the version of the API docs this client was built off-of
    def self.api_version
      'v2 2023-04-12'
    end

    def status
      authorise_and_send(http_method: :get, path: 'status')
    end

    # test can be current or future to get back test data
    def area_information(id:, test: nil)
      params = { id: id }
      params.merge!({ test: test }) if test
      authorise_and_send(http_method: :get, path: 'area', params: params)
    end

    def areas_nearby(latitude:, longitude:)
      params = { lat: latitude, lon: longitude }
      authorise_and_send(http_method: :get, path: 'areas_nearby', params: params)
    end

    def areas_search(text:)
      params = { text: text }
      authorise_and_send(http_method: :get, path: 'areas_search', params: params)
    end

    def topics_nearby(latitude:, longitude:)
      params = { lat: latitude, lon: longitude }
      authorise_and_send(http_method: :get, path: 'topics_nearby', params: params)
    end

    def check_allowance
      authorise_and_send(http_method: :get, path: 'api_allowance')
    end

    def historic_data(process: true)
      response = unauthorised_and_send(http_method: :get, path: "", custom_url: HISTORY_URL, format: :csv)
      return response unless process

      response["body"].split("\r\n")
    end
  end
end
