require 'rails_helper'

feature 'user deletes profile photo', %{
  As an authenticated user
  I want to delete profile photo
  So that I don't have to have a profile photo
} do
  # Acceptance Criteria
  # * If I'm signed in, I have the option to remove profile photo

  scenario 'authenticated user deletes profile photo' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Edit Profile')

    click_link 'Edit Profile'

    check('Remove image')
    fill_in 'Current password', with: user.password

    click_button 'Update Profile'

    expect(page).to have_content('Your account has been updated successfully.')
  end
end
