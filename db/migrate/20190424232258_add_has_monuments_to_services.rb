class AddHasMonumentsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :has_monuments, :boolean
  end
end
