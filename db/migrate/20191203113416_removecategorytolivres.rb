class Removecategorytolivres < ActiveRecord::Migration[6.0]
  def change
    remove_column :livres, :category_id
  end
end
