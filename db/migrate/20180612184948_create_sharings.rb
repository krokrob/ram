class CreateSharings < ActiveRecord::Migration[5.1]
  def change
    create_table :sharings do |t|
      t.references :user, foreign_key: true
      t.references :memory, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end
