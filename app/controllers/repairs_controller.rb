class RepairsController < ApplicationController
  before_action :set_repair, only: [:show]

  def show
    render json: @repair
  end

  def create
    @repair = Repair.new(repair_params)
    @repair.update_contact_details(contact_params)
    params[:workOrders].each do |work_order_params|
      work_order = WorkOrder.new
      work_order.sorCode = work_order_params[:sorCode]
      work_order.supplierRef = work_order_params[:supplierRef]
      @repair.work_orders << work_order
    end
    if @repair.save
      render json: @repair
    else
      render json: @repair.errors, status: :unprocessable_entity
    end
  end

  private
  def set_repair
    unless @repair = Repair.find_by_repairRequestReference(params[:id])
      render status: :not_found
    end
  end

  def repair_params
    params.require(:repair).permit(
      :repairRequestReference,
      :propertyReference,
      :problemDescription,
      :priority,
    )
  end

  def contact_params
    params.require(:contact).permit(
      :name,
      :telephoneNumber,
      :emailAddress,
      :callbackTime,
    )
  end
end
