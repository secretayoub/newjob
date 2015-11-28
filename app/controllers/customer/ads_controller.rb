class Customer::AdsController < CustomersController
  before_action :set_customer_ad, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @customer_ads = current_admin.ads.tagged_with(params[:tag])
    else
      @customer_ads = current_admin.ads
    end
  end


  def show
    @customer_ad = @customer_ad
  end

  def show_candidat
    @candidat = Candidat.find(params[:candidat_id])
  end

  def new
    @customer_ad = Customer::Ad.new
  end

  # GET /customer/ads/1/edit
  def edit
  end

  def create
    @customer_ad = Customer::Ad.new(customer_ad_params)
    @customer_ad.customer = current_admin.customer

    respond_to do |format|
      if @customer_ad.save
        format.html { redirect_to @customer_ad, notice: 'Ad was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer_ad.update(customer_ad_params)
        format.html { redirect_to @customer_ad, notice: 'Ad was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @customer_ad.destroy
    respond_to do |format|
      format.html { redirect_to customer_ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_customer_ad
      @customer_ad = Customer::Ad.find(params[:id])
    end

    def customer_ad_params
      params.require(:customer_ad).permit(:title,
                                          :ad_text,
                                          :advantage,
                                          :profil,
                                          :mission,
                                          :tag_list,
                                          :renumeration_id,
                                          contract_type_ids: [])
    end
end
