class Dwelling < Property
  belongs_to :sub_block, foreign_key: 'parentReference', primary_key: 'propertyReference'
  has_many :residents

  def as_json(*)
    super.merge({
      maintainable: self.maintainable,
      floor: self.floor,
      residents: self.residents.count,
      heating: self.heating,
      toilets: self.toilets,
      bathrooms: self.bathrooms,
    })
  end

  def block
    sub_block.block
  end

  def estate
    block.estate
  end
end
