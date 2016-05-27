class AddUserId < ActiveRecord::Migration
  def change
    add_column :articles ,:user_id ,:Integer
  end
end
