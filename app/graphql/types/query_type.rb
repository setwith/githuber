# app/graphql/types/query_type.rb

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
    end

    private

    def fetch_user_data(login)
      response = Net::HTTP.get_response(URI("https://api.github.com/users/#{login}"))

      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body.to_s)
      else
        raise StandardError, "Failed to fetch user data"
      end
    end

    def fetch_repos_data(login)
      response = Net::HTTP.get_response(URI("https://api.github.com/users/#{login}/repos"))

      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body.to_s)
      else
        raise StandardError, "Failed to fetch repositories data"
      end
    end
  end
end
