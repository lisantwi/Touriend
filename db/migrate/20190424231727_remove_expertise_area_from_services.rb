class RemoveExpertiseAreaFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :expertise_area, :string
  end
end
