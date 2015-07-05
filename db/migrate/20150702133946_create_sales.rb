class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.belongs_to :shop, index: true
      t.belongs_to :book, index: true
      t.integer :copies_in_stock
      t.integer :copies_sold
      t.timestamps
    end
  end
end
