class AddNameToLaunches < ActiveRecord::Migration[7.1]
  def change
    add_column :launches, :name, :string
  end
end
