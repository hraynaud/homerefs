class ReviewsController < ApplicationController

  def home

  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(params[:review])

    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to reviews_url
  end
end
