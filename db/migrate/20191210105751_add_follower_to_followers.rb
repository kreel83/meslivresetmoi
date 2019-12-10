class AddFollowerToFollowers < ActiveRecord::Migration[6.0]
  def change
    add_column :followers, :follower, :integer
  end
end
