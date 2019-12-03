class Tag < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :color, :string
  end
end
