require 'rails_helper'

feature 'user deletes profile', %Q{
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app
} do
  # Acceptance Criteria
  # * If I'm signed in, I have the option to delete my profile
  # * When I delete my profile successfullly
  # * I get a confirmation that my profile has been deleted

  # * If I try to delete another users profile
  # * I get an error that that I cant delete another users profile

  scenario 'account owner deletes their profile' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link 'Edit Profile'

    click_button 'Delete Account'

    expect(page).to have_content "Account successfully deleted."
  end

  # scenario 'account owner deletes their profile' do
  #   user = FactoryGirl.create(:user)
  #
  #   visit new_user_session_path
  #
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #
  #   click_button 'Log in'
  #
  #   click_link 'Edit Profile'
  #
  #   click_button 'Delete Account'
  #
  #   expect(page).to have_content "Account successfully deleted"
  # end

end
