require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  it "adds tasks and returns tasks" do
    task_list = TaskList.new
    task_1 = double :task
    task_2 = double :task
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2] 
   end

   it "returns completed tasks" do
      task_list = TaskList.new
      task_1 = double :task, complete?: true
      task_2 = double :task, complete?: true
      task_list.add(task_1)
      task_list.add(task_2)
      expect(task_list.all_complete?).to eq true
   end

  # Unit test `#all` and `#all_complete?` behaviour
end
