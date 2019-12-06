class AddNotestoReadings < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :notes, :string
    add_column :readings, :indice, :float
  end
end
