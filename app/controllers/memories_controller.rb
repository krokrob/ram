class MemoriesController < ApplicationController
  before_action :set_memory, only: [ :show, :update, :destroy]

  def index
    @memories = current_user.memories
  end

  def show
  end

  def create

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
