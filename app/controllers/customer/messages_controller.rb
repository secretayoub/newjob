class Customer::MessagesController < ApplicationController
  before_action :set_customer_message, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @user = User.find(params[:user])
    @message = current_admin.messages.new
  end

  def edit
  end

  def send_message
    recipient = User.find(params[:user])
    current_admin.send_message(recipient, params[:body], params[:subject])
    redirect_to customer_ads_path
  end


  private
    def set_customer_message
      @customer_message = Customer::Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_message_params
      params[:customer_message]
    end
end
