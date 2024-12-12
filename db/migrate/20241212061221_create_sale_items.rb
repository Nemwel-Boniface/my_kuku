class CreateSaleItems < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_items do |t|
      t.string :item_type, null: false
      t.string :category, null: false
      t.integer :quantity, null: false
      t.decimal :price_per_unit, precision: 10, scale: 2, null: false
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
