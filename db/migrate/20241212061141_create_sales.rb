class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.decimal :total_price
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
