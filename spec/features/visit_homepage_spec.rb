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
end
