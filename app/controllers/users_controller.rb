class UsersController < ApplicationController
  def create
  end

  def new
  end

  def show
  end

  def index
    @chefs = User.where(is_a_chef: true)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:cocktail).permit(:first_name, :last_name, :address, :postcode, :email, :password, :phone_number, :photo)
  end

end


