class ChefsController < ApplicationController
  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
    @booking = Booking.new
    counter = 0
    reviews = 0
    @chef.bookings.each do |b|
      if b.review
      counter += b.review.rating.to_i
      reviews += 1
      end    
    end
    if counter > 0
      @rating = counter/reviews
      
    else @rating = 0
    end
  end

  def new
    @chef = Chef.create
  end

  def create
    @chef = Chef.new(chef_params)
    current_user.is_a_chef = true
    current_user.save
    @chef.user = current_user
    @chef.save
    if @chef.save
        redirect_to root_path
      else
        render :new
      end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def chef_params
    params.require(:chef).permit(:description, :cuisine, :location_range, :price, :chef_postcode, photos: [])
  end



end
