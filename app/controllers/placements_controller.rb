class PlacementsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @placements = Placement.all
  end

  def new
    @placement = Placement.new
  end

  def create
    @placement = Placement.new(placement_params)
    if @placement.save
      redirect_to placement_path(@placement), notice: 'New placement added'
    else
      render :new
    end
  end

  def show
    @placement = Placement.find(params[:id])
  end

  private

  def placement_params
    params.require(:placement).permit(:title, :address, :description,
                                      :price, :photos_cache, {photos: []})
  end
end
