# frozen_string_literal: true

require 'net/http'
require 'json'

module Types
  class QueryType < GraphQL::Schema::Object
    field :get_user_info, Types::UserType, null: true do
      description 'get info about user and his repos'
      argument :login, String, required: true
    end

    def get_user_info(login:)
      user_data = fetch_user_data(login)
      repos_data = fetch_repos_data(login)
      { name: user_data['name'], repos: repos_data }
    rescue StandardError => e
      { error: e.message }
    end

    private

    def fetch_user_data(login)
      response = Net::HTTP.get_response(URI("https://api.github.com/users/#{login}"))

      unless response.code.to_i == 200
        raise StandardError, "Failed to fetch user data (HTTP #{response.code}): #{response.message}"
      end

      JSON.parse(response.body.to_s)
    end

    def fetch_repos_data(login)
      response = Net::HTTP.get_response(URI("https://api.github.com/users/#{login}/repos"))

      unless response.code.to_i == 200
        raise StandardError, "Failed to fetch repositories data (HTTP #{response.code}): #{response.message}"
      end

      JSON.parse(response.body.to_s)
    end
  end
end
