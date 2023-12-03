class GithubInfoController < ApplicationController
   def index
  end

  def get_info
    login = params[:github_login]
    query = <<~GRAPHQL
      query {
        getUserInfo(login: "#{login}") {
          name
          repos {
            name
          }
        }
      }
    GRAPHQL

    result = GithuberSchema.execute(query)
    @user_info = result['data']['getUserInfo']
    # debugger
    render :index
  end
end
