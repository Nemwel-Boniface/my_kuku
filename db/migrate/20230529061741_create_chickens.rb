class CreateChickens < ActiveRecord::Migration[7.0]
  def change
    create_table :chickens do |t|
      t.integer :no_of_poultry
      t.string :poultry_type
      t.string :chicken_image
      t.float :age, default: 0.0
      t.date :date_hatched
      t.integer :parent_id
      t.float :price_per_poultry
      t.references :user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
