class Api::V1::MemoriesController < ApplicationController
  def index
    memories = current_user.memories.global_search(params[:query]).with_pg_search_rank
    memories = memories.map do |memory|
      {
        id: memory.id,
        title: memory.title,
        photo_url: memory.photo_url,
        url: memory_path(memory)
      }
    end
    render json: memories, status: :ok
  end
end
