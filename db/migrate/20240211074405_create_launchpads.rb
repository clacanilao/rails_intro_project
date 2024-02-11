class CreateLaunchpads < ActiveRecord::Migration[7.1]
  def change
    create_table :launchpads, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.string :fullname
      t.string :description
      t.string :status
      t.integer :numoflaunches
      t.string :image
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
