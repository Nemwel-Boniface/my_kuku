class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.string :commenter_name, default: "Anonymous"
      t.references :blog, null: false, foreign_key: {to_table: :blogs}

      t.timestamps
    end
  end
end
