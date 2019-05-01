class AddCityToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :city, :string
  end
end
