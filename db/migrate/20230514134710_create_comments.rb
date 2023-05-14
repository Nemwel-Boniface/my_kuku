class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.string :commenter_name

      t.timestamps
    end
  end
end
