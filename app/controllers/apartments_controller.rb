class ApartmentsController < ApplicationController

  def index
    @building = Building.find(params[:bldg])
    @apartments = @building.apartments
  end

  def new
    @apartment = Apartment.new
    @building = Building.find(params[:bldg])
  end

  def create

    @apartment = Apartment.create(params[:apartment])
    if @apartment.save
      redirect_to new_review_path(:apt => @apartment.id, :bldg => @apartment.building_id), :notice => "Apartment Created"
    else
      render :new
    end

  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def edit
    @apartment =  Apartment.find(params[:id])

  end

  def update
    @apartment =  Apartment.find(params[:id])
    @apartment.update_attributes(params[:apartment])
    @apartment.save
    redirect_to apartment_path(@apartment)
  end

end
