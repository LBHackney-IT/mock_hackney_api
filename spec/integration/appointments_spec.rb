require 'swagger_helper'

describe 'appointments API' do
  path '/work_orders/{workOrderReference}/available_appointments' do
    get 'Retrieves available appointments' do
      tags 'Appointments'
      produces 'application/json'
      parameter name: :workOrderReference, :in => :path, :type => :string

      response '200', 'work order found' do
        schema type: :object,
          properties: {
            metadata: {
              type: :object,
              properties: {
                resultset: {
                  type: :object,
                  properties: {
                    count: { type: :integer },
                    offset: { type: :integer },
                    limit: { type: :integer },
                  },
                },
              },
            },
            results: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  beginDate: { type: :string },
                  endDate: { type: :string },
                  bestSlot: { type: :boolean }
                },
              },
            },
          }

        let(:work_order) {
          create(:work_order, workOrderReference: "345345")
        }
        let(:workOrderReference) {
          work_order.workOrderReference
        }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['results'].first['beginDate']).to be_a(String)
        end
      end

      response '404', 'work order not found' do
        let(:workOrderReference) { 'invalid' }
        run_test!
      end
    end
  end
end
