class TestController < ApplicationController
  include Readability::Helpers::Authentication
  helper Readability::Helpers::Authentication

  def show
    @bookmarks = readability(:bookmarks, {favorite: params[:favorite] || 0, archive: params[:archive] || 0}) if readabilified?
  end
end