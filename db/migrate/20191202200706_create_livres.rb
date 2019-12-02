class CreateLivres < ActiveRecord::Migration[6.0]
  def change
    create_table :livres do |t|
      t.string :imageurl
      t.string :title
      t.text :description
      t.string :author
      t.references :category, null: false, foreign_key: true
      t.string :googleid

      t.timestamps
    end
  end
end
