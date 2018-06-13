class MemoriesController < ApplicationController
  before_action :set_memory, only: [ :show, :update, :destroy]

  def index
    @memories = policy_scope(Memory)
  end

  def show
    @marker = [{
      lat: @memory.latitude,
      lng: @memory.longitude,
      infoWindow: { content: render_to_string(partial: "/memories/map_box", locals: { memory: @memory }) }
    }]
  end

  def new
    @memory = Memory.new
    authorize @memory
    if params[:latitude] && params[:longitude]
      @address = Geocoder.search([params[:latitude], params[:longitude]]).first&.data&.[]('formatted_address')
      @marker = [{
        lat: params[:latitude],
        lng: params[:longitude]
      }]
    end
    render layout: "naked"
  end

  def create
    @memory = Memory.new(memory_params)
    @memory.user = current_user
    authorize @memory
    if @memory.save
      redirect_to memories_path
    else
      @marker = [{
        lat: @memory.latitude,
        lng: @memory.longitude
      }]
      render :new
    end
  end

  def destroy

  end

private

  def set_memory
    @memory = Memory.find(params[:id])
    @sharing = Sharing.create(memory: @memory)
    authorize @memory
  end

  def memory_params
    params.require(:memory).permit(:title, :photo, :photo_cache, :address)
  end
end
