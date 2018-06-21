class NotesController < ApplicationController
  before_action :find_target
  def index
    render json: {items: @target.notes.order('created_at DESC')}
  end

  def create
    @note = @target.notes.build(note_params)
    if @note.save
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end
  private

  def find_target
    if params[:work_order_id]
      @target = WorkOrder.find_by_workOrderReference(params[:work_order_id])
    else params[:property_id]
      @target = Property.find_by_propertyReference(params[:property_id])
    end
    unless @target
      render status: :not_found
    end
  end

  def note_params
    params.require(:note).permit(:user, :text)
  end
end
