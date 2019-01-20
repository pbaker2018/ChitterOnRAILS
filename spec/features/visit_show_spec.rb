require 'rails_helper'
require 'spec_helper'
require 'timecop'

feature 'visit user show page' do
  scenario 'will display the selected message' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'My test message!'
    fill_in :name, with: 'Test Name'
    click_button 'Submit'
    click_link('My test message!')
    expect(page).to have_content("Here is your selected peep")
    expect(page).to have_button('Update Peep')
    expect(page).to have_button('Delete Peep')
    expect(page).to have_button('Homepage')
  end

  scenario 'will allow user to edit peep after clicking update button' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'My test message!'
    fill_in :name, with: 'Test Name'
    click_button 'Submit'
    click_link('My test message!')
    click_button 'Update Peep'
    expect(page).to have_content('Please update your peep:')
    expect(page).to have_button('Update Peep')
    expect(page).to have_button('Homepage')
  end

  scenario 'will take user back to homepage after clicking homepage button' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'My test message!'
    fill_in :name, with: 'Test Name'
    click_button 'Submit'
    click_link('My test message!')
    click_button 'Homepage'
    expect(page).to have_content("Welcome to Pauline's Chitter App")
  end

  scenario 'will allow user to logout from the show page' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'Test Message!'
    fill_in :name, with: 'Test Name'
    click_button 'Submit'
    click_link('Test Message!')
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
