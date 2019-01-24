require 'rails_helper'
require 'spec_helper'
require 'timecop'

feature 'visit edit page' do
  scenario 'will allow user to logout from the edit page' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@example.com'
    fill_in :user_user_name, with: 'Name'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'Test Message!'
    click_button 'Submit'
    click_link('Test Message!')
    click_button 'Update Peep'
    click_link('Logout')
    expect(page).to have_content("Log in")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Remember me")
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Forgot your password?")
    expect(page).to have_button("Log in")
  end

  scenario 'will take user back to homepage after clicking homepage button' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@example.com'
    fill_in :user_user_name, with: 'Name'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'My test message!'
    click_button 'Submit'
    click_link('My test message!')
    click_button 'Update Peep'
    click_button 'Homepage'
    expect(page).to have_content("Welcome to Pauline's Chitter App")
  end

    # scenario 'will allow user to update their selected peep' do
    #   visit '/'
    #   click_link('Sign up')
    #   fill_in :user_email, with: 'test@example.com'
    #   fill_in :user_user_name, with: 'Name'
    #   fill_in :user_password, with: 'password'
    #   fill_in :user_password_confirmation, with: 'password'
    #   click_button 'Sign up'
    #   fill_in :content, with: 'Test Message!'
    #   click_button 'Submit'
    #   click_link('Test Message!')
    #   click_button 'Update Peep'
    #   fill_in :content, with: 'UPDATED Test Message!'
    #   click_button 'Update Peep'
    #   expect(page).to have_content("Welcome to Pauline's Chitter App")
    #   expect(page).to have_content("UPDATED Test Message!")
    # end
end
