class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      
     t.string :article_name
     t.string :caption
     t.integer :customer_id

      t.timestamps
    end
  end
end
