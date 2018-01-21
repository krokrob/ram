class MemoriesController < ApplicationController
  before_action :set_memory, only: [ :show, :update, :destroy]

  def index
    @memories = current_user.memories
  end

  def show
    @marker = [{
      lat: @memory.latitude,
      lng: @memory.longitude#,
      # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
    }]
  end

  def new
    @memory = Memory.new
    render layout: "naked"
  end

  def create
    @memory = Memory.new(memory_params)
    @memory.user = current_user
    if @memory.save
      redirect_to memories_path
    else
      render :new
    end
  end

  def destroy

  end

private

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def memory_params
    params.require(:memory).permit(:title, :photo, :address)
  end
end
