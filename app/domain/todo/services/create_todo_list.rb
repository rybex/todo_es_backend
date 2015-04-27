module Todo
  module Services
    class CreateTodoList
      include Service

      def call(command)
        build(command.aggregate_id, List).create(command.title)
      end
    end
  end
end
