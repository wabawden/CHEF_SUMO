class PagesController < ApplicationController
  def home
    @chef = Chef.all.sample
  end
end
