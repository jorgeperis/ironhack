require 'date'
require 'pry'


class Task
    attr_reader :content, :id, :status, :created_at
    @@current_id = 1
    def initialize(content,status = false)
        @status = status
        @content = content
        @created_at = Time.now
        @updated_at = nil
        @id = @@current_id
        @@current_id += 1
    end

    def complete?
      @status
    end

    def complete!
      @status = true
    end

    def incomplete!
      @status = false
    end

    def update_content!(content)
      updated_at
      @content = content
    end

    def updated_at
      @updated_at = Time.now
    end
end

class TodoList
    attr_reader :tasks
    def initialize(user)
        @tasks = []
        @user = user
        #@todo_store = YAML::Store.new("./public/tasks.yml")
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
end

# todo = TodoList.new('Jorge')
# task = Task.new('To do homework')
# task1 = Task.new('See a movie')
# task2 = Task.new('Go to the party')
# task3 = Task.new('go to Ironhack')
# todo.add_task(task)
# todo.add_task(task1)
# todo.add_task(task2)
# todo.add_task(task3)
# task1.complete!
#
# todo.sorted_tasks.each do |x|
#   puts "#{x.id} => #{x.content} #{x.status}"
# end
