class AddStatusToReading < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :public, :boolean
  end
end
