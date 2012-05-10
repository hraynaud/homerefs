class BuildingsController < ApplicationController
  # GET /buildings
  # GET /buildings.json

  before_filter :authenticate_user, :only => [:new, :edit, :update, :create]

  def index
    if (params[:neighborhood].present? || params[:address].present? || params[:zipcode].present?)
      @buildings =   Building.locate(params).order(:address).page params[:page]
    elsif params[:search]
      @buildings = Building.search(params[:search]).order(:address).page params[:page]
    else
      @buildings =Building.order(:address).page params[:page]
    end
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

  def create
    @building = Building.new(params[:building])

    if @building.save
      redirect_to buildings_path
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
end
