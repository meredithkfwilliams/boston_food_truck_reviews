class Vendor < ActiveRecord::Base
  has_many :reviews
  has_many :vendor_categories
  has_many :categories, through: :vendor_categories
  has_many :vendor_location_schedules
  has_many :locations, through: :vendor_location_schedules

  validates_presence_of :vendor_name

  def self.approve(vendor)
    vendor.update(viewable: true)
  end

  def self.search(query)
    where("vendor_name ilike ?", "%#{query}%")
  end

  def self.approval(params)
    ownership = ["Claim Business", "Approve Ownership", "Deny Claim"]
    if params[:commit] == "Approve" || params[:commit] == "Delete"
      approval_type = "Vendor"
    elsif ownership.include?(params[:commit])
      approval_type = "Ownership"
    end
    approval_type
  end

  def self.ownership_decision(params)
    @vendor = Vendor.find(params[:id])
    if params["commit"] == "Claim Business"
      if @vendor.claimed_status == "Unclaimed"
        @vendor.update(owner_id: params["user"].id, claimed_status: "Pending")
        flash = "Submitted for approval."
      elsif @vendor.claimed_status == "Pending"
        flash = "This business is pending a previous ownership claim"
      end
    elsif params["commit"] == "Approve Ownership"
      @vendor.update(claimed_status: "Claimed")
      flash = "Owner approved."
    elsif params["commit"] == "Deny Claim"
      @vendor.update(claimed_status: "Unclaimed")
      flash = "Owner denied."
    end
    flash
  end
end
