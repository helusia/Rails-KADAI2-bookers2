class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.string :profile_image
      t.timestamps
    end
  end
end
