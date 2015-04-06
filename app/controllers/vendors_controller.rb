class VendorsController < ApplicationController
  def index
    @vendors = Vendor.where(viewable: true).page params[:page]
    @new_vendor = Vendor.new
  end

  def show
    @vendor = Vendor.find(params[:id])
    @reviews = @vendor.reviews
    @review = Review.new
  end

  def create
    authenticate_user!
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
    params.require(:vendor).permit(:vendor_name)
  end

end
