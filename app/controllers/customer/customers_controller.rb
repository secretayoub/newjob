class Customer::CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer_customer, only: [:show, :edit, :update, :destroy]

  # GET /customer/customers
  # GET /customer/customers.json
  def index
    @customer_customers = Customer::Customer.all
  end

  # GET /customer/customers/1
  # GET /customer/customers/1.json
  def show
  end

  # GET /customer/customers/new
  def new
    @customer_customer = Customer::Customer.new
  end

  # GET /customer/customers/1/edit
  def edit
  end

  # POST /customer/customers
  # POST /customer/customers.json
  def create
    @customer_customer = Customer::Customer.new(customer_customer_params)

    respond_to do |format|
      if @customer_customer.save
        format.html { redirect_to @customer_customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer_customer }
      else
        format.html { render :new }
        format.json { render json: @customer_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer/customers/1
  # PATCH/PUT /customer/customers/1.json
  def update
    respond_to do |format|
      if @customer_customer.update(customer_customer_params)
        format.html { redirect_to @customer_customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_customer }
      else
        format.html { render :edit }
        format.json { render json: @customer_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer/customers/1
  # DELETE /customer/customers/1.json
  def destroy
    @customer_customer.destroy
    respond_to do |format|
      format.html { redirect_to customer_customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_customer
      @customer_customer = Customer::Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_customer_params
      params.require(:customer_customer).permit(:company_name, :company_description, :city, :zip_code, :avatar)
    end
end
