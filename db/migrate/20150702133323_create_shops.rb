class CreateShops < ActiveRecord::Migration
  def up
    create_table :shops do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :shops
  end
end
