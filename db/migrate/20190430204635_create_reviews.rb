class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :service, foreign_key: true
      t.references :reservation, foreign_key: true
      t.references :traveler, foreign_key: { to_table: :users }
      t.references :guide, foreign_key: { to_table: :users }
      t.string :type

      t.timestamps
    end
  end
end
