class CreatePincategories < ActiveRecord::Migration
  def change
    create_table :pincategories do |t|
      t.integer :pin_id
      t.integer :category_id

      t.timestamps
    end
  end
end
