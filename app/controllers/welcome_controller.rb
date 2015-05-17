class WelcomeController < ApplicationController
  def index
    @data = params
  end
end
