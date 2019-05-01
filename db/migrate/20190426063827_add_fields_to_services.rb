class AddFieldsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :latitude, :float
  end
end
