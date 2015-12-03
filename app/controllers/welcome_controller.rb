class WelcomeController < ApplicationController
  before_action :set_customer_ad, only: :show
  def index
    @search = CustomerAdsSearch.new(params[:search])
    @ads = @search.search.only(:id).page(params[:page]).load(
        customer: {scope: Customer::Ad.includes(:customer)} )
  rescue Elasticsearch::Transport::Transport::Errors::BadRequest => e
    @ads = []
    @error = e.message.match(/QueryParsingException\[([^;]+)\]/).try(:[], 1)
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
