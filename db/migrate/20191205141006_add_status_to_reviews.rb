class AddStatusToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :status, :boolean, default: false
  end
end
