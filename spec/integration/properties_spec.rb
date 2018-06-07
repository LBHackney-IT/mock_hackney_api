require 'swagger_helper'

describe 'properties API' do
  path '/properties/?postcode={postcode}' do
    get 'Finds properties that match a postcode' do
      tags 'Properties'
      produces 'application/json'
      parameter name: :postcode, :in => :path, :type => :string

      response '200', 'properties found' do
        schema type: :object,
          properties: {
            results: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  address: { type: :string },
                  postcode: { type: :string },
                  propertyReference: { type: :string },
                },
              },
            },
          }
        let(:property) {
          create(:property, postcode: "e5 8te")
        }
        let(:postcode) {
          property.postcode
        }
        run_test! do |response|
          expect(response.body).to eq({results: [property]}.to_json)
        end
      end

      response '400', 'invalid post code' do
        let(:postcode) { 'invaliddddd' }
        run_test!
      end
    end
  end

  path '/properties/{propertyReference}' do
    get 'Retrieves a property' do
      tags 'Properties'
      produces 'application/json'
      parameter name: :propertyReference, :in => :path, :type => :string

      response '200', 'properties found' do
        schema type: :object,
          properties: {
            address: { type: :string },
            postcode: { type: :string },
            propertyReference: { type: :string },
            maintainable: { type: :boolean },
          }
        let(:property) {
          create(:property, propertyReference: "000023")
        }
        let(:propertyReference) {
          property.propertyReference
        }
        run_test! do |response|
          expect(response.body).to eq(property.to_json)
        end
      end

      response '404', 'invalid property reference' do
        let(:propertyReference) { 'invalid' }
        run_test!
      end
    end
  end
end
