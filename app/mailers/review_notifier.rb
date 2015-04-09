class ReviewNotifier < ApplicationMailer
  default from: "reviews@example.com"
  def new_review(review)
    @review = review
    if !@review.vendor.owner_id.nil?
      mail(
        to: User.find(@review.vendor.owner_id).email,
        subject: "New Review for #{@review.vendor.vendor_name}")
    end
  end
end
