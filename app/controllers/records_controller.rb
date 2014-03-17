class RecordsController < InheritedResources::Base



  def new
    @record = Record.new
    @record.request_id = params[:id]

  end

  def create
    create! do |format|
      if @record.errors.empty? # failure
        format.html { redirect_to request_path(@record.request) }
      end
    end

  end

  def resource_params
    return [] if request.get?
    [ params.require(:record).permit(:name, :record, :request_id) ]
  end
end