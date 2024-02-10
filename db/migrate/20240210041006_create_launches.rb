class CreateLaunches < ActiveRecord::Migration[7.1]
  def change
    create_table :launches, id: false do |t|
      t.string :id, primary_key: true
      t.datetime :date
      t.references :rocket, null: false, foreign_key: true
      t.references :launchpad, null: false, foreign_key: true
      t.string :outcome

      t.timestamps
    end
  end
end
