require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'Test', email: 'test@gmail.com', password: 12_345_678, password_confirmation: 12_345_678)
    @user.save
    @group = Group.new(name: 'Group', icon: 'icon link', user_id: @user.id)
  end

  it 'is valid' do
    expect(@group).to be_valid
  end

  it 'name should be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'icon should be present' do
    @group.icon = nil
    expect(@group).to be_valid
  end
end