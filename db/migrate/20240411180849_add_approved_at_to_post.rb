class AddApprovedAtToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :approved_at, :date
  end
end
