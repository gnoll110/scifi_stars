class StarController < ApplicationController
  def index
    @data = params
    star_name = params[:query]
    puts star_name
    star_finder = ScifiStar::StarFinder.new.find(star_name)
  end
end
