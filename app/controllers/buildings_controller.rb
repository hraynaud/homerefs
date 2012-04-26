class BuildingsController < ApplicationController
  # GET /buildings
  # GET /buildings.json

  before_filter :authenticate_user, :only => [:new, :edit, :update, :create]

  def index
    @buildings = if session[:results]
                   session[:results]
                 else
                   Building.all
                 end
    session[:results] = nil
  end


  def search

  end


  def results
    @buildings = Building.search(params)
    session[:results] = @buildings
    render :index
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
