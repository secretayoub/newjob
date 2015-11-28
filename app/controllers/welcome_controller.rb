class WelcomeController < ApplicationController
  before_action :set_customer_ad, only: :show
  def index
    if params[:tag]
      @ads = Customer::Ad.all.tagged_with(params[:tag])
    else
      @ads = Customer::Ad.all
    end
  end

  def show
    @candidat_ad = CandidatAd.new
    @ad = @customer_ad
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_ad
      @customer_ad = Customer::Ad.find(params[:id])
    end

end
