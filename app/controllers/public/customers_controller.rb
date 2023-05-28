class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    
  end

  def update
    if current_customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

   def unsubscribe
   end

   def withdraw
      @customer = current_customer
      @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
   end

  private
  def customer_params
    params.require(:customer).permit(:nickname, :email, :profile_image)
  end
end
