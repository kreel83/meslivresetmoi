class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :livre, null: false, foreign_key: true
      t.datetime :startdate
      t.datetime :enddate
      t.string :status

      t.timestamps
    end
  end
end
