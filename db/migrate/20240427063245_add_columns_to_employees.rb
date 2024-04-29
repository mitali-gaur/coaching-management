class AddColumnsToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :name, :string
    add_column :employees, :phone_number, :string
  end
end
