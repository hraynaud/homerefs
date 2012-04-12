class BuildingsController < ApplicationController
  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = if flash[:results]
                   flash[:results]
                 else
                   Building.all
                 end
  end


  def search

  end


  def results
    bldg = Building.search(params).first
    redirect_to apartments_path(:bldg => bldg.id)
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
