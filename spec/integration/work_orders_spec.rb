require 'swagger_helper'

describe 'work_order API' do
  let(:note1) {
    create(:note, target: work_order, text: 'Note 1')
  }
  let(:note2) {
    create(:note, target: work_order, text: 'Note 1')
  }
  let(:work_order) {
    create(:work_order, workOrderReference: "345345")
  }
  let(:workOrderReference) {
    work_order.workOrderReference
  }

  path '/work_orders/{workOrderReference}/notes' do
    get 'Retrieves notes for a work order' do
      tags 'Proposed'
      produces 'application/json'
      parameter name: :workOrderReference, :in => :path, :type => :string

      response '200', 'work order found' do
        schema type: :object,
          properties: {
            results: {
              type: :array,
              items: {
                "$ref": '#/definitions/note'
              },
            },
          }

        before do
          note1
          note2
        end
        run_test! do |response|
          expect(response.body).to eq({items: [note2, note1]}.to_json)
        end
      end

      response '404', 'work order not found' do
        let(:workOrderReference) { 'invalid' }
        run_test!
      end
    end
  end

  path '/work_orders/{workOrderReference}/notes' do
    post 'Creates an note for the work order' do
      tags 'Proposed'
      consumes 'application/json'
      parameter name: :workOrderReference, :in => :path, :type => :string
      parameter name: :note, in: :body, schema: {
        "$ref": '#/definitions/note_request'
      }

      response '200', 'note created' do
        schema '$ref' => '#/definitions/note'
        let(:note) {
          {
            user: "U0001",
            text: "Note contents",
          }.with_indifferent_access
        }
        let(:note_response) {
          note_response = note.dup
          note_response[:created] = an_instance_of(String)
          note_response
        }
        run_test! do |response|
          expect(JSON.parse(response.body)).to match(note_response)
          expect(work_order.notes.last.text).to eq("Note contents")
        end
      end

      response '422', 'invalid request' do
        let(:note) { { beginDate: 1234 } }
        run_test!
      end
    end
  end
end
