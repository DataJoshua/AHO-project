class CreateExels < ActiveRecord::Migration[7.1]
  def change
    create_table :exels do |t|
      t.string :label
      t.references :user

      t.timestamps
    end
  end
end
