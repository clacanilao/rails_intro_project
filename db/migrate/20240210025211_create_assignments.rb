class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.references :crew, null: false, foreign_key: true
      t.references :launch, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
