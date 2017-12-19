class CreateMemoryContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :memory_contacts do |t|
      t.references :memory, foreign_key: true
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
