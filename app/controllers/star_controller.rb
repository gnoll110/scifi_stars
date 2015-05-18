class StarController < ApplicationController
  def index
    @data = params
    star_name = params[:query]
    star_finder = StarFinder.new
    result = star_finder.find(star_name)
    @data = result
  end
end
