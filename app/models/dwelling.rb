class Dwelling < Property
  belongs_to :sub_block, foreign_key: 'parentReference', primary_key: 'propertyReference'

  def block
    sub_block.block
  end

  def estate
    block.estate
  end
end
