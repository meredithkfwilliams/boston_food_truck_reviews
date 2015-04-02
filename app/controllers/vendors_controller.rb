class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
    @new_vendor = Vendor.new
  end

  def show
    @vendor = Vendor.find(params[:id])
    @reviews = @vendor.reviews
  end

  def create
    @vendor = Vendor.create(vendor_params)
    @vendor.viewable = false
    if @vendor.save
      flash[:notice] = "Vendor added. Pending review."
      redirect_to vendors_path
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  protected
  def vendor_params
    params.require(:vendor).permit(:vendor_name, :viewable)
  end

end
