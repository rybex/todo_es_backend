module Todo
  class CommandHandler

    def initialize
      @command_observers = {
          'AddItemToList'   => Services::AddItemToList.new,
          'CreateTodoList'  => Services::CreateTodoList.new,
          'RemoveItem'      => Services::RemoveItem.new,
          'RemoveTodoList'  => Services::RemoveTodoList.new
      }
    end

    def execute(command)
      command_observers[command.class.name.demodulize].call(command)
    end

    private
    attr_reader :command_observers
  end
end