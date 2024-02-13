class AddImageToLaunches < ActiveRecord::Migration[7.1]
  def change
    add_column :launches, :image, :string
  end
end
