class CreateRockets < ActiveRecord::Migration[7.1]
  def change
    create_table :rockets, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.string :description
      t.decimal :height
      t.decimal :mass
      t.string :variant
      t.string :image
      t.integer :costperlaunch
      t.integer :successratepercent

      t.timestamps
    end
  end
end
