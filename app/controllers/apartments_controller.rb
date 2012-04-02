class ApartmentsController < ApplicationController

  def index
    @apartments = Apartment.all
  end

  def new
    @apartment = Apartment.new

  end

  def create

    @apartment = Apartment.create(params[:apartment])
    redirect_to apartments_path, :notice => "Apartment Created"
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def edit
    @apartment =  Apartment.find(params[:id])

  end

  def update
    @apartment =  Apartment.find(params[:id])
    @aparment.update(params[:apartment])
  end

end
