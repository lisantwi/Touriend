class AddHasFoodToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :has_food, :boolean
  end
end
