# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  before(:each) do
    User.create(name: 'John', email: 'john@example.com', password: 'password', password_confirmation: 'password')
  end

  it 'should login successfully' do
    visit(new_user_session_path)
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('You have to confirm your email address before continuing.')
  end

  it 'error because email/password are wrong' do
    visit(new_user_session_path)
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'wrong_password'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
