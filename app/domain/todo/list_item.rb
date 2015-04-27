module Todo
  class ListItem

    def initialize(data)
      @list_id  = data[:list_id]
      @item_id  = data[:item_id]
      @title    = data[:title]
      @type     = data[:type]
    end

    attr_reader :list_id, :item_id, :title, :type
  end
end