class ChefsController < ApplicationController
  def index
    @chefscount = Chef.all
    # @chefs = Chef.order(:name).page params[:page]
    @chefs = Chef.order(created_at: :desc).page(params[:page])
  end

  def show
    @chef = Chef.find(params[:id])
    @booking = Booking.new
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
