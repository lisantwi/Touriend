class AddHasOutdoorsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :has_outdoors, :boolean
  end
end
