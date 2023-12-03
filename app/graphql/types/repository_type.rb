# frozen_string_literal: true

module Types
  class RepositoryType < GraphQL::Schema::Object
    field :name, String, null: true
  end
end
