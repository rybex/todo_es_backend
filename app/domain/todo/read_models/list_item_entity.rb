module Todo
  module ReadModels
    class ListItemEntity < ActiveRecord::Base
      self.table_name  = 'list_items'
    end
  end
end
