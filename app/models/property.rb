class Property < ApplicationRecord
  before_save :format_postcode

  def as_json(*)
    {
      address: self.address,
      postcode: self.postcode,
      propertyReference: self.propertyReference,
    }
  end

  def self.format_postcode(postcode)
    postcode.upcase.gsub(/\W/, "")
  end

  private
  def format_postcode
    self.postcode = Property.format_postcode(self.postcode)
  end
end
