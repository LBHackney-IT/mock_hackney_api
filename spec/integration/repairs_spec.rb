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
        let(:repair) {
          {
            repairRequestReference: "1234",
            propertyReference: "5678",
            problemDescription: "broken",
            priority: "N",
            contact: {
              name: "name",
              telephoneNumber: "07777777777",
              emailAddress: "test@test.com",
              callbackTime: "morning"
            },
            work_orders: [
              {
                sorCode: "123",
                supplierRef: "456"
              }
            ]
          }.with_indifferent_access
        }
        let(:repair_response) {
          repair_response = repair.dup
          repair[:work_orders][0][:workOrderReference] = an_instance_of(String)
          repair_response
        }
        run_test! do |response|
          expect(JSON.parse(response.body)).to match(repair_response)
          repair = Repair.last
          expect(repair.repairRequestReference).to eq("1234")
          expect(repair.contact_name).to eq("name")
          expect(repair.work_orders.first.sorCode).to eq("123")
        end
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

        let(:repair) {
          create(:repair, repairRequestReference: "345345")
        }
        let(:repairRequestReference) {
          repair.repairRequestReference
        }
        run_test! do |response|
          expect(response.body).to eq(repair.to_json)
        end
      end

      response '404', 'repair not found' do
        let(:repairRequestReference) { 'invalid' }
        run_test!
      end
    end
  end
end
