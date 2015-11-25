class Customer::AdsController < ApplicationController
  before_action :set_customer_ad, only: [:show, :edit, :update, :destroy]

  # GET /customer/ads
  # GET /customer/ads.json
  def index
    if params[:tag]
      @customer_ads = current_admin.ads.tagged_with(params[:tag])
    else
      @customer_ads = current_admin.ads
    end
  end

  # GET /customer/ads/1
  # GET /customer/ads/1.json
  def show
  end

  # GET /customer/ads/new
  def new
    @customer_ad = Customer::Ad.new
  end

  # GET /customer/ads/1/edit
  def edit
  end

  # POST /customer/ads
  # POST /customer/ads.json
  def create
    @customer_ad = Customer::Ad.new(customer_ad_params)
    @customer_ad.customer = current_admin.customer

    respond_to do |format|
      if @customer_ad.save
        format.html { redirect_to @customer_ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @customer_ad }
      else
        format.html { render :new }
        format.json { render json: @customer_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer/ads/1
  # PATCH/PUT /customer/ads/1.json
  def update
    respond_to do |format|
      if @customer_ad.update(customer_ad_params)
        format.html { redirect_to @customer_ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_ad }
      else
        format.html { render :edit }
        format.json { render json: @customer_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer/ads/1
  # DELETE /customer/ads/1.json
  def destroy
    @customer_ad.destroy
    respond_to do |format|
      format.html { redirect_to customer_ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_ad
      @customer_ad = Customer::Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_ad_params
      params.require(:customer_ad).permit(:title,
                                          :ad_text,
                                          :tag_list,
                                          :renumeration_id,
                                          contract_type_ids: [])
    end
end
