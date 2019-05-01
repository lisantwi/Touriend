class AddHasMuseumToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :has_museum, :boolean
  end
end
