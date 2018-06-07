require 'swagger_helper'

describe 'appointments API' do
  let(:work_order) {
    create(:work_order, workOrderReference: "345345")
  }
  let(:workOrderReference) {
    work_order.workOrderReference
  }

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

  path '/work_orders/{workOrderReference}/appointments' do
    post 'Creates an appointment' do
      tags 'Appointments'
      consumes 'application/json'
      parameter name: :workOrderReference, :in => :path, :type => :string
      parameter name: :appointment, in: :body, schema: {
        "$ref": '#/definitions/appointment'
      }

      response '200', 'appointment created' do
        schema '$ref' => '#/definitions/appointment'
        let(:appointment) {
          {
            beginDate: "2018-06-08T08:02:00.000Z",
            endDate: "2018-06-08T08:59:00.000Z",
          }.with_indifferent_access
        }
        run_test! do |response|
          expect(JSON.parse(response.body)).to match(appointment)
          appointment = Appointment.last
          expect(appointment.beginDate).to eq("2018-06-08T08:02:00.000Z")
        end
      end

      response '422', 'invalid request' do
        let(:appointment) { { beginDate: 1234 } }
        run_test!
      end
    end

    get 'Retrieves an appointment' do
      tags 'Appointments'
      produces 'application/json'
      parameter name: :workOrderReference, :in => :path, :type => :string

      response '200', 'appointment found' do
        schema '$ref' => '#/definitions/appointment'

        before do |example|
          @appointment = create(:appointment, work_order: work_order)
        end

        run_test! do |response|
          expect(response.body).to eq(@appointment.to_json)
        end
      end

      response '404', 'repair not found' do
        let(:workOrderReference) { 'invalid' }
        run_test!
      end
    end
  end
end
