require 'rails_helper'
require 'spec_helper'
require 'timecop'

feature 'visit user homepage' do
  scenario 'will display a header' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Welcome to Pauline's Chitter App")
    expect(page).to have_content('Here are your previously submitted peeps')
  end

  scenario 'will display a form to post peeps' do
    # visit '/'
    # fill_in :user_email, with: 'test@gmail.com'
    # fill_in :user_password, with: 'password'
    # click_button 'Log in'
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Type a new 'peep' here")
    expect(page).to have_button('Submit')
  end


  scenario 'will display submitted message' do
    visit '/'
    click_link('Sign up')
    fill_in :user_email, with: 'test@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
    fill_in :content, with: 'My test message!'
    fill_in :name, with: 'Test Name'
    click_button 'Submit'
    expect(page).to have_content('My test message')
    expect(page).to have_content('Posted by: Test Name')
    expect(page).to have_content(Time.now.strftime('%d-%m-%Y %H:%M:%S'))
  end
end
