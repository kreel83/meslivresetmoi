class CreateEndings < ActiveRecord::Migration[6.0]
  def change
    create_table :endings do |t|
      t.references :endinglist, null: false, foreign_key: true
      t.references :livre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
