class RenameNotesToReadins < ActiveRecord::Migration[6.0]
  def change
    rename_column :readings, :notes, :notation
  end
end
