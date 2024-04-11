class AddStateToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :state, :string, default: "draft"
  end
end
