class Articles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :des
      t.timestamps
    end
  end
end
