# frozen_string_literal: true

require 'json'
require 'faraday'

module Localedata
  class Client
    def initialize(access_token)
      @access_token = access_token
    end

    def pull(project_id, locale)
      success = false
      status_code = 0
      yaml_data = nil
      error_message = nil

      begin
        get_data = { access_token: @access_token, project_id: project_id, language_code: locale }
        response = connection.get('/api/v1/exports', get_data)

        success = response.success?
        status_code = response.status

        data = JSON.parse(response.body)
        yaml_data = data['yaml']
        error_message = data['error']
      rescue Faraday::ConnectionFailed
        success = false
        error_message = 'API connection failed.'
      rescue JSON::ParserError
        success = false
        error_message = 'API response parsing failed.'
      end

      { success: success, status_code: status_code, yaml: yaml_data, error: error_message }
    end

    def connection
      @connection ||= Faraday.new(url: 'https://app.localedata.com')
    end
  end
end
