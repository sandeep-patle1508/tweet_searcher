class TwitterController < ApplicationController

  def index
    @tweets = []
  end

  def search
    @tweets = Twitter::Client.new.search({ q: params[:query] })

    respond_to do |format|
       format.js
    end
  end
end
