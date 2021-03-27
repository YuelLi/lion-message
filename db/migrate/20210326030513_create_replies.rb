class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :user
      t.string :content
      t.references :post
      t.timestamps
    end
  end
end
