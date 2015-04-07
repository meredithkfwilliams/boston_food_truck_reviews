require 'rails_helper'
  RSpec.describe Vote, type: :model do
    it { should belong_to(:user) }
    it { should belong_to(:review) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:review) }
    let(:user) { User.create(email: "goofy@gmail.com", password: 'password') }
    let(:vendor) { Vendor.create(vendor_name: "Yum") }
    let(:review) { Review.create(user_id: user.id, vendor_id: vendor.id, rating: 1, body: 'Hi') }
    @value = 1

    describe "self.user_already_voted(user, review)" do
      context "user can only vote once per review" do
        it "should prevent the user from voting twice" do
          expect(Vote.user_already_voted(user, review).empty?).to eq(true)
        end

        it "should check if the user has already voted" do
          Vote.create(user_id: user.id, review_id: review.id, value: 1)
          expect(Vote.user_already_voted(user, review).empty?).to eq(false)
        end
      end
    end

    describe "self.same_vote(user, review, value)" do
      context "user tries to up-vote or down-vote twice" do
        it "should tell them they cant do that" do
          Vote.create(user_id: user.id, review_id: review.id, value: 1)
          Vote.create(user_id: user.id, review_id: review.id, value: 1)
          expect(Vote.same_vote(user, review, @value)).to eq(true)
        end
      end
    end

    describe "self.destroy_user_vote(user, review)" do
      context "user can change their vote" do
        it "should delete their vote" do
          vote = Vote.create(user_id: user.id, review_id: review.id, value: 1)
          Vote.destroy_user_vote(user, review)
          expect(Vote.where(id: vote.id).empty?).to eq(true)
        end
      end
    end
end
