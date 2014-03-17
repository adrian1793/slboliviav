class RequestsController < ApplicationController

  before_filter :authenticate_user!

  before_action :set_request, only: [:show, :show_lawyer, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    #raise current_user.inspect
    if current_user.is_customer?
      #o redirecionar a la pagina de index de customer
      @requests = Request.where( customer_id: current_user.customer.id)
      if @requests.empty?
        redirect_to new_request_path
      end
    else
      #redireccionar a la pagina de index de lawyer
      redirect_to index_lawyer_requests_path
    end

  end
  def index_lawyer
    @requests = Request.where( state: 'New')


  end

  def speciality_areas

    @practice_area = PracticeArea.find(params[:practice_area_id])
    @speciality_area = @practice_area.speciality_areas.empty? ? [] : SpecialityArea.where(practice_area_id: @practice_area.id)

    respond_to do |format|
      format.html { render :partial => 'requests/speciality_areas', :object => @speciality_area } # index.html.haml
    end

  end


  def index_admin
    @requests = Request.where( state: 'New')

  end
  # GET /requests/1
  # GET /requests/1.json
  def show
  end
  # GET /requests/1
  # GET /requests/1.json
  def show_lawyer
  end
  # GET /requests/new
  def new
    @request = Request.new( state: 'New')
  #  @request.records.new
    @practice_area = PracticeArea.first
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @practice_area = PracticeArea.find(params[:practice_area])

    @request = Request.new(request_params)
    @request.customer_id = current_user.customer.id
    @request.practice_area_id = @practice_area.id
    respond_to do |format|
      if @request.save
        #raise @request.inspect

        format.html { redirect_to new_record_path(:id =>@request.id), notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:type_person, :type, :speciality_area_id, :case_about, :monthly_income, :practice_area_id,
                                    :method_payment_id, :description, :state, records_attributes: [:name, :record])
  end
end
