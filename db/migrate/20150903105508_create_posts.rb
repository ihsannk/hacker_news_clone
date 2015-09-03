class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :post_title
  		t.string :post_text
  		t.string :post_link
  		t.integer :user_id
  		t.timestamps null: false
  	end
  end
end
