class AddHasShoppingToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :has_shopping, :boolean
  end
end
