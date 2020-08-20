class PagesController < ApplicationController
  def home
    sweetalert('Text', 'Title', persistent: 'Awesome!')
    @chefs = Chef.all.sample(3)
  end
end
