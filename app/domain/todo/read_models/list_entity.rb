module Todo
  module ReadModels
    class ListEntity < ActiveRecord::Base
      self.table_name  = 'lists'
    end
  end
end
