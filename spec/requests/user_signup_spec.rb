require 'rails_helper'

RSpec.describe 'User Signup', type: :feature do
  it 'should sign up successfully' do
    visit(new_user_registration_path)
    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'john@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end
end
