require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { FactoryGirl.build(:user) }

  describe "associations" do
    it { should have_many(:tasks) }
  end

  it 'is valid  user' do 
    expect(user.save).to be true 
  end

  it 'is not valid user attributes' do 
    expect(User.new).to_not be_valid
  end

end
