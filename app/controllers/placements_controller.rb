class PlacementsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    if params[:search] && params[:commit] == 'Search'
      @placements = Placement.search(params[:search][:title]).page params[:page]
    else
      @placements = Placement.all.page params[:page]
    end
  end

  def new
    @placement = Placement.new
  end

  def create
    @placement = Placement.new(placement_params)
    if @placement.save
      redirect_to placement_path(@placement), notice: 'Placement added'
    else
      render :new
    end
  end

  def show
    @placement = Placement.find(params[:id])
    @review = Review.new
  end

  private

  def placement_params
    params.require(:placement).permit(:title, :address, :description,
                                      :price, :photos_cache, {photos: []})
  end
end
