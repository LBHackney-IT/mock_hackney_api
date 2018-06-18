class PropertiesController < ApplicationController
  before_action :find_property, except: [:find]
  def find
    postcode = Property.format_postcode(params[:postcode])
    if postcode.length > 7
      render status: :bad_request
    else
      @properties = Dwelling.where(postcode: postcode).all
      render json: {results: @properties}
    end
  end

  def show
    render json: @property
  end

  def block
    render json: @property.block
  end

  def estate
    render json: @property.estate
  end

  def residents
    render json: { residents: @property.residents }
  end

  private

  def find_property
    unless @property = Dwelling.find_by_propertyReference(params[:id])
      render status: :not_found
    end
  end
end
