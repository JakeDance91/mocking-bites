class TaskFormatter
  def initialize(task) 
    @task = task
  end

  def format
    if @task.complete?
      "- [x] #{@task.title}"
    else 
      "- [ ] #{@task.title}"
    end
  end
end