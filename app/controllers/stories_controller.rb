class StoriesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @stories = Story.all
    @admin = admin_signed_in?
    respond_with(@stories)
  end

  def show
    @admin = admin_signed_in?
    respond_with(@story)
  end

  def new
    @story = Story.new
    respond_with(@story)
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    @story.save
    redirect_to "/stories"
    # respond_with(@story, template: 'stories/index')
  end

  def update
    @story.update(story_params)
    respond_with(@story)
  end

  def destroy
    @story.destroy
    respond_with(@story)
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:date, :title, :description, :storyteller, :location_id, :audio)
    end
end
