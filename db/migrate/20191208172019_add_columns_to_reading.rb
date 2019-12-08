class AddColumnsToReading < ActiveRecord::Migration[6.0]
  def change
      add_column :readings, :comment, :text
      add_column :readings, :feeling, :text
      add_column :readings, :like, :integer
      add_column :readings, :unlike, :integer
      add_column :readings, :discover, :string
  end
end
