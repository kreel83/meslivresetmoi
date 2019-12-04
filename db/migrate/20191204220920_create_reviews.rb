class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :reading, null: false, foreign_key: true
      t.text :comment
      t.text :feeling
      t.integer :like
      t.integer :unlike
      t.text :discover

      t.timestamps
    end
  end
end
