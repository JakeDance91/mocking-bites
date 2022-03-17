require "task_formatter"

RSpec.describe TaskFormatter do
  context "When given an incomplete task" do
    it "returns task as string starting with '- [ ]'" do
      task_1 = double(:task, complete?: false, title: "Walk the dog")
      task_to_format = TaskFormatter.new(task_1)
      expect(task_to_format.format).to eq "- [ ] Walk the dog"
    end
  end
  context "When given a complete task" do
    it "returns task as a string starting with '- [x]'" do
      task_1 = double(:task, complete?: true, title: "Wash the car")
      task_to_format = TaskFormatter.new(task_1)
      expect(task_to_format.format).to eq "- [x] Wash the car"
    end
  end  
end 
