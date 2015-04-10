require 'rails_helper'
include CarrierWaveDirect::Test::CapybaraHelpers


feature 'user changes profile photo', %{
  As an authenticated user
  I want to change my profile photo
  So that I can see a new profile photo
} do
  # Acceptance Criteria
  # * If I'm signed in, I have the option to change a profile photo
  let!(:user) {FactoryGirl.create(:user)}

  scenario 'authenticated user changes profile photo' do
    visit new_user_session_path
    sign_in(user)
    expect(page).to have_content('Edit Profile')
    click_link 'Edit Profile'

    attach_file 'user_avatar', File.join("#{Rails.root}/spec/support/images/example.jpg")
    fill_in 'Current password', with: user.password
    click_button 'Update Profile'

    expect(page).to have_content('Your account has been updated successfully.')
  end
end
