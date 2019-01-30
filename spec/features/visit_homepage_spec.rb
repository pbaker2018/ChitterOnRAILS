require 'rails_helper'
require 'spec_helper'
require 'timecop'

feature "visit homepage" do
  scenario 'will display a log-in form' do
    visit '/'
    expect(page).to have_content("Log in")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Remember me")
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Forgot your password?")
    expect(page).to have_button("Log in")
  end

  scenario 'will allow a new user to sign-up' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@example.com'
    fill_in :user_user_name, with: 'Name'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Welcome to Pauline's Chitter App, Name")
    expect(page).to have_content('Here are all previously submitted peeps')
  end

  scenario 'will allow a signed-up user to log-in' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@example.com'
    fill_in :user_user_name, with: 'Name'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    click_link('Logout')
    fill_in :user_email, with: 'test@example.com'
    fill_in :user_password, with: 'password'
    click_button 'Log in'
    expect(page).to have_content("Welcome to Pauline's Chitter App, Name")
    expect(page).to have_content('Here are all previously submitted peeps')
  end
end
