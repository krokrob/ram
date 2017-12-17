class CreateMemories < ActiveRecord::Migration[5.1]
  def change
    create_table :memories do |t|
      t.string :title
      t.string :photo
      t.references :user, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
