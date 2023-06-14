class CreateChickens < ActiveRecord::Migration[7.0]
  def change
    create_table :chickens do |t|
      t.string :tag_number
      t.string :chicken_images
      t.integer :age, default: 0
      t.date :date_hatched
      t.integer :parent_id
      t.references :user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
