class CreateListItemModel < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string    :uid
      t.string    :list_uid
      t.string    :title
      t.string    :item_type
    end
  end
end
