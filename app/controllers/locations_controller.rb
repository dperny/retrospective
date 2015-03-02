class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy, :stories]

  respond_to :html, :json

  def index
    @locations = Location.all
    respond_with(@locations)
  end

  def show
    respond_with(@location)
  end

  def stories
    # TODO: stub method because broken
    @stories = @location.stories
    respond_with(@stories, layout: "stories/index")
  end

  def new
    @location = Location.new
    respond_with(@location)
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    @location.save
    respond_with(@location)
  end

  def update
    @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    @location.destroy
    respond_with(@location)
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end
