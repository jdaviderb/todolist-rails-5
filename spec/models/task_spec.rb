require 'rails_helper'

RSpec.describe Task, type: :model do
  let (:task) { FactoryGirl.build(:task) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do 
    it { should validate_presence_of(:description) }
  end

  it 'is valid task' do 
    expect(task.save).to be true 
  end
end
