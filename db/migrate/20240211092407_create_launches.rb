class CreateLaunches < ActiveRecord::Migration[7.1]
  def change
    create_table :launches, id: false do |t|
      t.string :id, primary_key: true
      t.string :date
      t.references :rocket, type: :string, null: false, foreign_key: true
      t.references :launchpad, type: :string, null: false, foreign_key: true
      t.string :success

      t.timestamps
    end
  end
end
