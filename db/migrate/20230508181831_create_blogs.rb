class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :blog_image
      t.string :blog_title
      t.date :date_created
      t.integer :comments_counter, default: 0
      t.text :blog_text
      t.references :user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
