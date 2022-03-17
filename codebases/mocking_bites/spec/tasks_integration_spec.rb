require "task_list"
require "task"
require "task_formatter"

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  context "when task is not complete" do
      it "returns task as string starting with '- [ ]'" do
        task_1 = Task.new("Walk the dog")
        task_to_format = TaskFormatter.new(task_1)
        expect(task_to_format.format).to eq "- [ ] Walk the dog" 
    end
  end
  context "When given a complete task" do
    it "returns task as a string starting with '- [x]'" do
      task_1 = Task.new("Wash the car")
      task_1.mark_complete
      task_to_format = TaskFormatter.new(task_1)
      expect(task_to_format.format).to eq "- [x] Wash the car"
    end
  end  
end
