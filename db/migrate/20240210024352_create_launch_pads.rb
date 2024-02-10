class CreateLaunchPads < ActiveRecord::Migration[7.1]
  def change
    create_table :launch_pads, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.string :full_name
      t.string :description
      t.string :status
      t.integer :numberoflaunches
      t.string :image
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
