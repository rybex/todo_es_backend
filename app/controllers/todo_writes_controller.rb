class TodoWritesController < ApplicationController

  def create_list
    command = Todo::Commands::CreateTodoList.new(params)
    execute(command)
    head :ok
  end

  def remove_list
    command = Todo::Commands::RemoveTodoList.new(params)
    execute(command)
    head :ok
  end

  def add_todo_item
    command = Todo::Commands::AddItemToList.new(params)
    execute(command)
    head :ok
  end

  def remove_todo_item
    command = Todo::Commands::RemoveItem.new(params)
    execute(command)
    head :ok
  end

  private

  def execute(command)
    handler.execute(command)
  end

  def handler
    @handler ||= Todo::CommandHandler.new
  end

end