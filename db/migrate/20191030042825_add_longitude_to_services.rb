class AddLongitudeToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :longitude, :float
  end
end
