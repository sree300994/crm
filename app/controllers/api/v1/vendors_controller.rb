class Api::V1::VendorsController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
  	@vendors = Vendor.all
  	render json: @vendors
  end

  def create
  	@vendor = Vendor.new(vendor_params)
  	if @vendor.save
  		render json: @vendor
  	else
  		render json: {errors: @vendor.errors.full_messages }
  	end
  end

  private

  def vendor_params
  	params[:vendor].permit(:name, :company, :website)
  end
end
