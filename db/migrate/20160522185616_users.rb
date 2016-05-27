class Users < ActiveRecord::Migration
  def change
    create_table :users do |f|
      f.string :name
      f.string :email
      f.string :password
      f.timestamps

    end
  end
end
