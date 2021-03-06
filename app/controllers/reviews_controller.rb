class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    city = params[:city]
    @reviews = Review.by_city(city)
    json_response(@reviews.page(params[:page]))
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "Your review has been updated!"
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      render status: 200, json: {
        message: "Your review has been deleted!"
      }
    end
  end

  private
  def review_params
    params.permit(:author, :content, :rating, :city)
  end
end
