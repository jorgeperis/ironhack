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
