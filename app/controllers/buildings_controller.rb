class BuildingsController < ApplicationController
  # GET /buildings
  # GET /buildings.json

  before_filter :authenticate_user, :only => [:new, :edit, :update, :create]
  helper_method :sort_column, :sort_direction

  def index
    session[:disable_actions] = nil if params[:reviewer]
    if params[:search]
      if (params[:neighborhood].present? || params[:address].present? || params[:zipcode].present?)
      @buildings = Building.super_search(params).order(sort_column + " " + sort_direction)
      else
      @buildings = Building.search(params[:search]).order(sort_column + " " + sort_direction)
      end
    elsif (params[:neighborhood].present? || params[:address].present? || params[:zipcode].present?)
      @buildings =   Building.locate(params).order(sort_column + " " + sort_direction)
    else
      @buildings =Building.order(sort_column + " " + sort_direction)
    end
    @buildings = @buildings.page params[:page]
  end

  def show
    @building = Building.find(params[:id])
  end

  def new
    @building = Building.new

  end

  def edit
    @building = Building.find(params[:id])
  end


  def search
    session[:disable_actions] = true
  end

  def create
    @building = Building.new(params[:building])

    if @building.save
      redirect_to new_review_path(:bldg => @building.id)
    else
      render :new
    end
  end

  def update
    @building = Building.find(params[:id])

    if @building.update_attributes(params[:building])
      redirect_to @building, notice: 'building was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    redirect_to buildings_url
  end

  private
  def sort_column
    Building.column_names.include?(params[:sort]) ? params[:sort] : "score"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
