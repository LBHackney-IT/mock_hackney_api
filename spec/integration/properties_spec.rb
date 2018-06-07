require 'swagger_helper'

describe 'properties API' do
  path '/Properties/?postcode={postcode}' do
    get 'Retrieves a request' do
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
                  propertyReference: { type: :string }
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
end
