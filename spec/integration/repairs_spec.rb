require 'swagger_helper'

describe 'repairs API' do
  path '/repairs' do
    post 'Creates a repair' do
      tags 'Changed'
      consumes 'application/json'
      parameter name: :repair, in: :body, schema: {
        "$ref": '#/definitions/repair_request'
      }

      response '200', 'repair created' do
        schema '$ref' => '#/definitions/repair'
        let(:repair) {
          {
            propertyReference: "5678",
            problemDescription: "broken",
            priority: "n",
            contact: {
              name: "name",
              telephoneNumber: "07777777777",
              emailAddress: "test@test.com",
              callbackTime: "morning"
            },
            workOrders: [
              {
                sorCode: "123",
              }
            ]
          }.with_indifferent_access
        }
        let(:repair_response) {
          repair_response = repair.dup
          repair_response[:workOrders][0] = an_instance_of(Hash)
          repair_response[:repairRequestReference] = an_instance_of(String)
          repair_response[:priority] = "N"
          repair_response
        }
        run_test! do |response|
          expect(JSON.parse(response.body)).to match(repair_response)
          repair = Repair.last
          expect(repair.problemDescription).to eq("broken")
          expect(repair.contact_name).to eq("name")
          expect(repair.work_orders.first.sorCode).to eq("123")
        end
      end

      response '422', 'invalid request' do
        let(:repair) {
          {
            propertyReference: "5678",
            problemDescription: "broken",
            priority: "a",
            contact: {
              name: "name",
              telephoneNumber: "07777777777",
              emailAddress: "test@test.com",
              callbackTime: "morning"
            },
            workOrders: [
              {
                sorCode: "123",
              }
            ]
          }.with_indifferent_access
        }
        run_test!
      end
    end
  end

  path '/repairs/{repairRequestReference}' do
    get 'Retrieves a request' do
      tags 'Changed'
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
