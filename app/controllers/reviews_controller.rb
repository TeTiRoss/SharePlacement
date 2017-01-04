class ReviewsController < ApplicationController

  skip_before_action :authenticate_user, only: [:index, :photos]
  before_action :set_placement

  def index
    @reviews = @placement.reviews.page params[:page]
  end

  def new
    @review = Review.new
  end

  def create
    @review = @placement.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to placement_path(@placement), notice: 'You added review'
    else
      render :new
    end
  end

  def photos
    review = Review.find(params[:id])
    @photos = review.photos
  end

  private

  def set_placement
    @placement = Placement.find(params[:placement_id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :placement_id, :user_id,
                                   {photos: []}, :photos_cache)
  end
end
