
module Types
  class UserType < GraphQL::Schema::Object
    field :name, String, null: true
    field :repos, [Types::RepositoryType], null: true
  end
end
