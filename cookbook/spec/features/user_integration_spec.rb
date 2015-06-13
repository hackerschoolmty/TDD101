require 'rails_helper'

feature "As a user I can login" do
  let(:user) { FactoryGirl.create(:user) }

  scenario "with correct credentials" do
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: "12345678"

    click_button "Log in"

    expect(page).to have_content user.username
    expect(page.current_path).to eql root_path
  end
end