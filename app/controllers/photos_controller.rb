class PhotosController < ApplicationController
  def index
    @query = Unsplash::Photo.search params[:q], 1, 100
    @urls = @query.map do |photo|
      photo.urls.raw
    end
    json_response @urls
  end
end
