class CreateEggs < ActiveRecord::Migration[7.0]
  def change
    create_table :eggs do |t|
      t.integer :egg_count
      t.string :egg_size
      t.string :egg_color
      t.date :laid_on
      t.references :chicken, null: false, foreign_key: true

      t.timestamps
    end
  end
end
