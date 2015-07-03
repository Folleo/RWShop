class CreateProductSales < ActiveRecord::Migration
  def change
    create_table :product_sales do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :sales

      t.timestamps null: false
    end
  end
end
