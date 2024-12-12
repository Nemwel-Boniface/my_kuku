class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.decimal :total_price, precision: 10, scale: 2, null: false, default: 0.0
      t.string :status, null: false, default: "Pending"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
