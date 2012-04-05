class ApartmentsController < ApplicationController

  def index
    @apartments = Apartment.all
  end

  def new
    @apartment = Apartment.new

  end

  def create

    @apartment = Apartment.create(params[:apartment])
    if @apartment.save
      redirect_to apartments_path, :notice => "Apartment Created"
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
