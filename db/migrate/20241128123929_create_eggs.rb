class CreateEggs < ActiveRecord::Migration[7.0]
  def change
    create_table :eggs do |t|
      t.integer :egg_count
      t.string :egg_size
      t.string :poultry_type
      t.date :laid_on

      t.timestamps
    end
  end
end
