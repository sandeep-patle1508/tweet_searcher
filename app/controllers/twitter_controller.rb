class TwitterController < ApplicationController

  def index
    @tweets = []
  end

  # make Twitter Search API call to fetch the popular tweets
  # render result
  def search
    @tweets = Twitter::Client.new.search({ q: params[:query] })

    respond_to do |format|
       format.js
    end
  end
end
