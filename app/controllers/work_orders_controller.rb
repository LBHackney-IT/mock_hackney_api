class WorkOrdersController < ApplicationController
  before_action :set_work_order

  def available_appointments
    render json: {
      metadata: {
        resultset: {
          count: 2,
          offset: 0,
          limit: 10
        },
      },
      results: [
        {
          beginDate: (Date.today.at_beginning_of_week + 7.days + 9.hours).iso8601,
          endDate: (Date.today.at_beginning_of_week + 7.days + 10.hours).iso8601,
          bestSlot: true
        },
        {
          beginDate: (Date.today.at_beginning_of_week + 8.days + 16.hours).iso8601,
          endDate: (Date.today.at_beginning_of_week + 8.days + 17.hours).iso8601,
          bestSlot: false
        },
      ],
    }
  end

  def show_appointment
    render json: @work_order.appointment
  end

  def create_appointment
    @appointment = Appointment.new(appointment_params)
    @appointment.work_order = @work_order
    if @appointment.save
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_work_order
    unless @work_order = WorkOrder.find_by_workOrderReference(params[:id])
      render status: :not_found
    end
  end

  def appointment_params
    params.permit(:beginDate, :endDate)
  end
end
