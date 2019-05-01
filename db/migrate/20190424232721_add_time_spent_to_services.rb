class AddTimeSpentToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :time_spent, :string
  end
end
