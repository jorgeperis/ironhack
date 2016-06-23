require 'rspec'
require './todolist'


describe Task do
  subject { described_class.new('Buy the milk') }

  describe '#complete?' do
    let(:expected_output) { false }
    let(:result) { subject.complete? }

    it "Know if it's complete" do
      expect(result).to eq(expected_output)
    end
  end

  describe '#complete!' do
    let(:expected_output) { true }
    let(:result) { subject.complete! }

    it "makes de task complete" do
      expect(result).to eq(expected_output)
    end
  end

  describe '#incomplete!' do
    let(:expected_output) { false }
    let(:result) { subject.incomplete! }

    it "makes the task incomplete" do
      expect(result).to eq(expected_output)
    end
  end

  describe '#update_content!' do
    let(:input) { 'The new task' }
    let(:expected_output) { 'The new task' }
    let(:result) { subject.update_content!(input) }

    it "update content" do
      expect(result).to eq(expected_output)
    end
  end
end





describe TodoList do

  subject { described_class.new('Jorge')}

  before do
  @task = Task.new('The new task')
  @task2 = Task.new('Buy the milk')
  end

  describe '#add_task' do

    let(:input) { @task }
    let(:expected_output) { [@task] }
    let(:result) { subject.add_task(input)}

    it "Add task to TodoList" do
      expect(result).to eq(expected_output)
    end
  end
end

describe TodoList do

  subject { described_class.new('Jorge')}
  before do
  @task = Task.new('The new task')
  @task2 = Task.new('Buy the milk')
  subject.add_task(@task)
  subject.add_task(@task2)
  end

  describe 'find_task_by_id' do
    let(:input) { 7 }
    let(:expected_output) { @task }
    let(:result) { subject.find_task_by_id(input)}

    it "Find task by id" do
      expect(result).to eq(expected_output)
    end
  end
end

describe TodoList do

  subject { described_class.new('Jorge')}
  before do
  @task = Task.new('The new task')
  @task2 = Task.new('Buy the milk')
  subject.add_task(@task)
  subject.add_task(@task2)
  end

  describe '#delete_task' do
    let(:input) { 9 }
    let(:expected_output) { [@task2] }
    let(:result) { subject.delete_task(input)}

    it "Delete a task" do
      expect(result).to eq(expected_output)
    end
  end
end
