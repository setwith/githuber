# app/graphql/types/repository_type.rb

module Types
  class RepositoryType < GraphQL::Schema::Object
    field :name, String, null: true
  end
end
