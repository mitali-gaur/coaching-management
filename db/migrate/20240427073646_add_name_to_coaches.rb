class AddNameToCoaches < ActiveRecord::Migration[7.0]
  def change
    add_column :coaches, :name, :string
  end
end
