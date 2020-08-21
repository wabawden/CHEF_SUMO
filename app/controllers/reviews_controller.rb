class ReviewsController < ApplicationController
  def new
    @review = Review.new
    # @booking = Booking.find(params[:booking_id])
    # authorize@review
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @user = booking.user
    @review.booking = @booking
    @review.user = @user
    @review.save

    if @review.save
      redirect_to 'chef_path'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to chef_path(@review.booking.chef)
end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :booking_id)
  end

end
