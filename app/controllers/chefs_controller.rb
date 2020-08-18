class ChefsController < ApplicationController
  def index
  end

  def show
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
    params.require(:chef).permit(:description, :cuisine, :location_range, :price, :chef_postcode)
  end
end
