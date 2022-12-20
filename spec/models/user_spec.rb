require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Test', email: 'test@gamil.com', password: 12_345_678, password_confirmation: 12_345_678)
    @user.save
  end

  it 'is valid' do
    expect(@user).to be_valid
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
end
