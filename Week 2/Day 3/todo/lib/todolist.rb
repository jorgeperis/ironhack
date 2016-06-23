

class TodoList
    attr_reader :tasks
    def initialize(user)
        @tasks = []
        @user = user
        @todo_store = YAML::Store.new("./public/tasks.yml")
    end

    def add_task(task_name)
      @tasks.push(task_name)
    end

    def delete_task(id)
      @tasks.delete_if {|task| task.id == id}
    end

    def find_task_by_id(id)
      @tasks.find {|task| task.id == id}
    end

    def sorted_tasks
      @tasks.sort { | task1, task2 | task1.id <=> task2.id }
    end

    def sort_by_created
      @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
    end

    def save
      @todo_store.transaction do
        @todo_store[@user] = @tasks
      end
    end

    def load_tasks
      loaded = YAML::load(File.open("./public/tasks.yml"))
      loaded[@user].each do |task|
        @tasks.push(task)
      end


    end
end
