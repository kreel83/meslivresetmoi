class RemoveCategoryFromCriteres < ActiveRecord::Migration[6.0]
  def change
    remove_column :criteres, :category_id
  end
end
