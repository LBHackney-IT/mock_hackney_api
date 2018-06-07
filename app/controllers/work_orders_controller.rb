class WorkOrdersController < ApplicationController
  def available_appointments
    unless WorkOrder.find_by_workOrderReference(params[:id])
      render status: :not_found
    else
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
  end
end
