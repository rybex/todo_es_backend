Rails.application.routes.draw do
  resource :todo_write do
    member do
      post    :create_list
      delete  :remove_list
      post    :add_todo_item
      delete  :remove_todo_item
    end
  end
end
