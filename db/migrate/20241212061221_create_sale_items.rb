class CreateSaleItems < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_items do |t|
      t.string :item_type
      t.string :category
      t.integer :quantity
      t.decimal :price_per_unit
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
