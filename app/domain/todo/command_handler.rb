module Todo
  class CommandHandler

    def initialize
      @command_observers = [
          Services::AddItemToList.new,
          Services::CreateTodoList.new,
          Services::RemoveItem.new,
          Services::RemoveTodoList.new
      ]
    end

    def execute(command)
      command_observers.each do |observer|
        observer.call(command)
      end
    end

    private
    attr_reader :command_observers
  end
end