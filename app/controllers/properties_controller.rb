class PropertiesController < ApplicationController
  def find
    postcode = Property.format_postcode(params[:postcode])
    if postcode.length > 7
      render status: :bad_request
    else
      @properties = Property.where(postcode: postcode).all
      render json: {results: @properties}
    end
  end

  def show
    if @property = Property.find_by_propertyReference(params[:id])
      render json: @property
    else
      render status: :not_found
    end
  end
end
