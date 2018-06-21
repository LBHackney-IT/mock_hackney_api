class NotesController < ApplicationController
  before_action :set_work_order
  def index
    render json: {items: @work_order.notes.order('created_at DESC')}
  end

  def create
    @note = @work_order.notes.build(note_params)
    if @note.save
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end
  private

  def set_work_order
    unless @work_order = WorkOrder.find_by_workOrderReference(params[:work_order_id])
      render status: :not_found
    end
  end

  def note_params
    params.require(:note).permit(:user, :text)
  end
end
