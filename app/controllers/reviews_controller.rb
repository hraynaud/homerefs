class ReviewsController < ApplicationController
  before_filter :authenticate_user, :except => [:show, :index]

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
    @building = Building.find(params[:bldg])
    @rows = ReviewMetadata.all

    @hilows ={}

    @rows.each do |row|
      @hilows[row.field_name] = {"hi" => row.hi_text, "low" => row.low_text}
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(params[:review])
    @review.user_id = get_current_user.id

    if @review.save
      1.upto(3).each do |i|
        if params["review"]["image#{i}"]
          @review.building_images.create(building_id: @review.building_id, image: params["review"]["image#{i}"])
        end
      end
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
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

    redirect_to reviews_url
  end
end
