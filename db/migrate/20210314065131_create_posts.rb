class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :topic
      t.string :subject
      t.string :body
      t.string :department
      t.references :user
      t.timestamps
    end
  end
end
