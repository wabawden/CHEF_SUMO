class ChefsController < ApplicationController
  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
    @booking = Booking.new
  end

  def new

  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
