class CreateListModel < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :uid
      t.string :title
    end
  end
end
