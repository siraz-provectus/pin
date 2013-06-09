class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title
      t.integer :price
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
