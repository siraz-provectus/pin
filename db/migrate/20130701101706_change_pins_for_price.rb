class ChangePinsForPrice < ActiveRecord::Migration
  def up
    change_table :pins do |t|
      t.change :price, :string
    end
  end
  def down
    change_table :pins do |t|
      t.change :price, :integer
    end
  end
end
