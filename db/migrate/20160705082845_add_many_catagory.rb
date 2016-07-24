class AddManyCatagory < ActiveRecord::Migration
  def change
    create_table :catagorie_articles do |f|
  f.integer :article_id
      f.integer :catagory_id
    end
  end
end
