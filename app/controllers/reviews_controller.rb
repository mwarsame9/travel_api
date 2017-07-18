class ReviewsController < ApplicationController

  def index
    city = params[:city]
    # rating = params[:rating]

    @reviews = Review.by_city(city)
    # @reviews = Review.by_rating(rating)
    json_response(@reviews)
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
