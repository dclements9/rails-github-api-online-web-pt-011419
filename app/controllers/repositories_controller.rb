class RepositoriesController < ApplicationController
  
  def index
    response = Faraday.get "https://api.github.com/user/repos" do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
      req.headers['accept'] = 'application/json'
    end

    @repos = JSON.parse(response.body)
  end

end
