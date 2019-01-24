require 'rails_helper'
require 'spec_helper'
require 'timecop'

feature 'visit user homepage' do
  scenario 'will display a form to post peeps' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@example.com'
    fill_in :user_user_name, with: 'Name'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Type a new 'peep' here")
    expect(page).to have_button('Submit')
  end

  scenario 'will display submitted message' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@example.com'
    fill_in :user_user_name, with: 'Name'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'Test Message!'
    click_button 'Submit'
    expect(page).to have_content('Test Message')
    expect(page).to have_content('Posted by: Name')
    expect(page).to have_content(Time.now.strftime('%d-%m-%Y %H:%M:%S'))
  end

  scenario 'will delete submitted message' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_user_name, with: 'Name'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'Test Message!'
    click_button 'Submit'
    click_button 'Delete Peep'
    expect(page).not_to have_content('Test Message!')
    expect(page).not_to have_content('Posted by: Name')
  end

  scenario 'will allow user to logout from the user homepage' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_user_name, with: 'Name'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    click_link('Logout')
    expect(page).to have_content("Log in")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Remember me")
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Forgot your password?")
    expect(page).to have_button("Log in")
  end
end
