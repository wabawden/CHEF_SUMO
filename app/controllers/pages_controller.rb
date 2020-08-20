class PagesController < ApplicationController
  def home
    @chefs = Chef.all.sample(3)
  end
end
