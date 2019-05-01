class AddSummaryToGuideServices < ActiveRecord::Migration[5.2]
  def change
    add_column :guide_services, :summary, :text
  end
end
