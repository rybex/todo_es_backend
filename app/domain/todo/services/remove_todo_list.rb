module Todo
  module Services
    class RemoveTodoList
      include Service

      def call(command)
        build(command.aggregate_id, List).remove
      end
    end
  end
end
