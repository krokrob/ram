class Api::V1::MemoriesController < ApplicationController
  def index
    memories = policy_scope(Memory).global_search(params[:query])
    memories = memories.map do |memory|
      {
        id: memory.id,
        title: memory.title,
        photo_url: memory.photo_url,
        url: memory_path(memory),
        address: memory.address
      }
    end
    render json: memories, status: :ok
  end
end
