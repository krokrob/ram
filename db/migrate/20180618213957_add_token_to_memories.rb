class AddTokenToMemories < ActiveRecord::Migration[5.1]
  def change
    add_column :memories, :token, :string
  end
end
