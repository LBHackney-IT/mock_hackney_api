class AdminController < ActionController::Base
  def index
    @repairs = Repair.order("created_at DESC").first(5)
    @properties = Property.order("created_at DESC").last(5)
  end
end
