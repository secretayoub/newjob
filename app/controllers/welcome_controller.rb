class WelcomeController < ApplicationController
  def index
    if params[:tag]
      @ads = Customer::Ad.all.tagged_with(params[:tag])
    else
      @ads = Customer::Ad.all
    end
  end
end
