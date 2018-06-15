class SubBlock < Property
  belongs_to :block, foreign_key: 'parentReference', primary_key: 'propertyReference'
end
