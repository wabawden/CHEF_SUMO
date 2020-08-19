class UsersController < ApplicationController
  def create
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def home
    @bookings = Booking.where(user: current_user)
    @chef_bookings = Booking.where(chef: current_user.chef)
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


