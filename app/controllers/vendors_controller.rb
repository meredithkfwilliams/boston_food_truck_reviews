class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @vendor.reviews
  end

  def new
    @vendor = Vendor.new
  end

  def create
  end
end
