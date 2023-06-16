class AddSlugToChickens < ActiveRecord::Migration[7.0]
  def change
    add_column :chickens, :slug, :string
    add_index :chickens, :slug, unique: true
  end
end
