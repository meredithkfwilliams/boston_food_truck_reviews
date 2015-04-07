require 'rails_helper'

feature 'member votes on a review', %{
  As a reviewer
  I want to be able to leave an up or down vote on each review
  So that I can share my opinion with other users
} do
  # Acceptance Criteria
  # * If I'm signed in, I should be able to up/down vote a review
  # * If I up or down/vote a review
  # * I should see the score update on the page

  # * If I up or down/vote a review
  # * I should be able to modify my vote

  # * If I up or down/vote a review
  # * I should not be able to submit the same vote a second time

  scenario 'member posts up-vote to a review' do
    review_and_vote
    click_button 'Up'
    expect(page).to have_content 'Overall Vote Score: 1'
  end

  scenario 'member posts down-vote to a review' do
    review_and_vote
    click_button 'Down'
    expect(page).to have_content 'Overall Vote Score: -1'
  end

  scenario 'member up-votes then changes to down-vote' do
    review_and_vote
    click_button 'Up'
    click_button 'Down'
    expect(page).to have_content 'Overall Vote Score: -1'
  end

  scenario 'member votes up or down twice' do
    review_and_vote
    click_button 'Up'
    click_button 'Up'
    expect(page).to have_content 'You already did that!'
  end
end
