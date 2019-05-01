class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :gender
      t.string :language
      t.integer :price
      t.string :guide_name
      t.text :summary
      t.string :expertise_area
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
