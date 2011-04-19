class TestController < ApplicationController
  readabilify
  
  def show
    @bookmarks = readability(:bookmarks, {favorite: params[:favorite] || 0, archive: params[:archive] || 0}) if readabilified?
  end
end