class AddUnaccentExtensionToDataBase < ActiveRecord::Migration[5.1]
  def change
    enable_extension "unaccent"
  end
end
