require 'swagger_helper'

describe 'repairs API' do
  path '/repairs' do
    post 'Creates a repair' do
      tags 'Repairs'
      consumes 'application/json'
      parameter name: :repair, in: :body, schema: {
        "$ref": '#/definitions/repair'
      }

      response '201', 'repair created' do
        schema '$ref' => '#/definitions/repair'
        let(:repair) { {
          repairRequestReference: 1234,
          propertyReference: 1234,
          problemDescription: "broken",
          priority: "N"
        } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:repair) { { repairRequestReference: 1234 } }
        run_test!
      end
    end
  end

  path '/repairs/{repairRequestReference}' do
    get 'Retrieves a request' do
      tags 'Repairs'
      produces 'application/json'
      parameter name: :repairRequestReference, :in => :path, :type => :string

      response '200', 'repair found' do
        schema '$ref' => '#/definitions/repair'

        let(:repairRequestReference) { create(:repair, repairRequestReference: "345345").repairRequestReference }
        run_test!
      end

      response '404', 'repair not found' do
        let(:repairRequestReference) { 'invalid' }
        run_test!
      end
    end
  end
end
