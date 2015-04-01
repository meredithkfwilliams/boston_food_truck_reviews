class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @reviews = Review.where(vendor_id: @vendor)
  end
end
