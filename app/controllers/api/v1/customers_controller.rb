class Api::V1::CustomersController < ApplicationController

	skip_before_action :verify_authenticity_token
  def index
  	@customers = Customer.all
  	render json: @customers
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
  		render json: @customer
  	else
  		render json: {errors: @customer.errors.full_messages}
  	end
  end

  private

  def customer_params
  	params[:customer].permit(:name, :mobile, :email)
  end
end
