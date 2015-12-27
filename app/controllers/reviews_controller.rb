class ReviewsController < ApplicationController
  before_filter :authenticate_user, :except => [:show, :index]
  before_filter :set_metadata, :only => [:new, :edit, :create]

  def home

  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    # @review = Review.new
    @building = Building.find(params[:bldg])
    @review = @building.reviews.build
  end

  def edit
    @review = Review.find(params[:id])
    @building = @review.building
  end

  def create
    @review = current_user.reviews.build(params[:review])
    if @review.save
      save_images
      redirect_to @review, notice: 'Review was successfully created.'
    else
      @building = @review.building
      render action: "new"
    end
  end

  def update

    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        @review.calc_score
        save_images
        format.html {redirect_to @review, notice: 'Review was successfully updated.'}
        format.json { render :json => @review}
      else
        format.html {render action: "edit"}
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to reviews_path
  end

  private

  def save_images
    #TODO is there a better way to save these images at review create/update
    #time?
    1.upto(3).each do |i|
      if params["review"]["image#{i}"]
        @review.building_images.create(building_id: @review.building_id, image: params["review"]["image#{i}"])
      end
    end
  end

  def set_metadata
    @rows = ReviewMetadata.order("position asc")
    @hilows ={}
    @rows.each do |row|
      @hilows[row.field_name] = {"hi" => row.hi_text, "low" => row.low_text}
    end
  end
end
