require 'rails_helper'

feature 'user edits profile', %Q{
  As an authenticated user
  I want to update my information
  So that I can post items and review them
} do
  # Acceptance Criteria
  # * If I'm signed in, I have the option to update my profile
  # * When I update my profile successfullly
  # * I get a confirmation that my profile has been udpated and I can see my updated information

  # * When I update my profile with invalid information
  # * I get a error that displays the invalid fields and their error(s)

  scenario 'authenticated user edits profile successfully' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Edit Profile')

    click_link 'Edit Profile'

    fill_in 'Email', with: 'somenewemail@gmail.com'
    fill_in 'Current password', with: user.password

    click_button 'Update Profile'

    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'authenticated user edits profile incorrectly' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link 'Edit Profile'

    fill_in 'Email', with: ""

    click_button 'Update Profile'

    expect(page).to have_content("can't be blank")
  end

end
