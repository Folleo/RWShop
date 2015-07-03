class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :discount_percent
      t.integer :discount_amount
      t.string :image

      t.timestamps null: false
    end
  end
end
