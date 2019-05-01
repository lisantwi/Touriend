class AddHasNightToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :has_night, :boolean
  end
end
