class CustomersController < ApplicationController

  before_filter :authenticate_user!, :except => [:new, :create, :state, :city]

  before_action :set_customer, only: [:show, :edit, :update, :destroy]


  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  def state
    @country = Country.find(params[:country_id])

    @cities = @country.states.empty? ? [] : City.where(state_id: @country.states.first.id)
    respond_to do |format|
      format.html { render :partial => 'states', :object => @country.states } # index.html.haml
    end
  end
  def city
    @state = State.find(params[:state_id])

    @cities = @state.cities.empty? ? [] : City.where(state_id: @state.id)
    respond_to do |format|
      format.html { render :partial => 'cities', :object => @cities } # index.html.haml
    end
  end
  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    if user_signed_in?
      redirect_to requests_path()
    else
      @customer = Customer.new
      @customer.build_user


    end
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      #params.require(:customer).permit(:first_name, :middle_name, :last_name, :company, :ci, :orgin, :date_of_birth, :gender, :address, :department, :city, :phone, :cell_phone)
      params.require(:customer).permit(:first_name, :middle_name, :last_name, :company, :ci, :orgin, :date_of_birth, :gender, :address, :city_id, :phone, :cell_phone ,
                                       user_attributes: [:email, :password, :password_confirmation])
    end
end
