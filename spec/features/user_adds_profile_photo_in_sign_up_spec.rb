require 'rails_helper'

feature 'user adds profile photo', %{
  As an authenticated user
  I want to add profile photo
  So that I can see an avatar on my edit profile page
} do
  # Acceptance Criteria
  # * If I'm signed in, I have the option to change a profile photo

  scenario 'authenticated user changes profile photo' do

    visit new_user_registration_path

    fill_in 'Email', with: 'newuseremail@gmail.com'
    fill_in 'Password', with: 'Password123'
    fill_in 'Password confirmation', with: 'Password123'

    attach_file 'user_avatar', File.join("#{Rails.root}/spec/support/images/example.jpg")
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
