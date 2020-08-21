class BookingsController < ApplicationController
  def index
  end

  def show

  end

  # def new
  #   @bookings = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    # date = "#{params[:booking]['date(3i)']}/#{params[:booking]['date(2i)']}/#{params[:booking]['date(1i)']}"
    # @booking.date = Date.parse(date)
    @booking.user = current_user
    @chef = Chef.find(booking_params[:chef_id])
    @review = Review.new
    @review.booking = @booking
    @review.save
    if @booking.save
      sweetalert_success('Your resource is created and available.', 'Successfully created', persistent: 'Awesome!')
      redirect_to users_home_path
    else
      redirect_to chef_path(@chef)
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :chef_id, :date)
  end

end
