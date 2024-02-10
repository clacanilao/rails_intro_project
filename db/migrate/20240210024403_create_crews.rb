class CreateCrews < ActiveRecord::Migration[7.1]
  def change
    create_table :crews, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.string :image
      t.string :status
      t.string :wiki_link

      t.timestamps
    end
  end
end
