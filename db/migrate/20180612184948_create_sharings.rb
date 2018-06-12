class CreateSharings < ActiveRecord::Migration[5.1]
  def change
    create_table :sharings do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.references :memory, foreign_key: true

      t.timestamps
    end
  end
end
