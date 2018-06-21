require 'swagger_helper'

describe 'properties API' do
  path '/properties/?postcode={postcode}' do
    get 'Finds dwellings that match a postcode' do
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
          create(:estate, postcode: "e5 8te")
          create(:block, postcode: "e5 8te")
          create(:sub_block, postcode: "e5 8te")
          create(:dwelling, postcode: "e5 8te")
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
      tags 'Changed'
      produces 'application/json'
      parameter name: :propertyReference, :in => :path, :type => :string

      response '200', 'properties found' do
        schema type: :object,
          properties: {
            address: { type: :string },
            postcode: { type: :string },
            propertyReference: { type: :string },
            maintainable: { type: :boolean },
            floor: { type: :integer },
            residents: { type: :integer },
            heating: { type: :string },
            toilets: { type: :integer },
            bathrooms: { type: :integer },
          }
        let(:property) {
          create(:dwelling, propertyReference: "000023")
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

  path '/properties/{propertyReference}/block' do
    get 'Retrieves a block for a property' do
      tags 'Proposed'
      produces 'application/json'
      parameter name: :propertyReference, :in => :path, :type => :string

      response '200', 'properties found' do
        schema type: :object,
          properties: {
            address: { type: :string },
            postcode: { type: :string },
            propertyReference: { type: :string },
            maintainable: { type: :boolean },
            managerName: { type: :string },
            managerPhone: { type: :string },
            managerEmail: { type: :string },
            floors: { type: :integer },
            entranceDoors: { type: :integer },
            lifts: { type: :integer },
            heating: { type: :string },
          }
        let(:property) {
          create(:dwelling, propertyReference: "000023")
        }
        let(:propertyReference) {
          property.propertyReference
        }
        run_test! do |response|
          expect(response.body).to eq(property.block.to_json)
        end
      end

      response '404', 'invalid property reference' do
        let(:propertyReference) { 'invalid' }
        run_test!
      end
    end
  end

  path '/properties/{propertyReference}/estate' do
    get 'Retrieves an estate for a property' do
      tags 'Proposed'
      produces 'application/json'
      parameter name: :propertyReference, :in => :path, :type => :string

      response '200', 'properties found' do
        schema type: :object,
          properties: {
            address: { type: :string },
            postcode: { type: :string },
            propertyReference: { type: :string },
            maintainable: { type: :boolean },
            managerName: { type: :string },
            managerPhone: { type: :string },
            managerEmail: { type: :string },
          }
        let(:property) {
          create(:dwelling, propertyReference: "000023")
        }
        let(:propertyReference) {
          property.propertyReference
        }
        run_test! do |response|
          expect(response.body).to eq(property.estate.to_json)
        end
      end

      response '404', 'invalid property reference' do
        let(:propertyReference) { 'invalid' }
        run_test!
      end
    end
  end


  path '/properties/{propertyReference}/residents' do
    get 'Retrieves the residents for a dwelling' do
      tags 'Proposed'
      produces 'application/json'
      parameter name: :propertyReference, :in => :path, :type => :string

      response '200', 'properties found' do
        schema type: :object,
          properties: {
            residents: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  residentReference: { type: :string },
                  name: { type: :string },
                  last_call: { type: :string },
                },
              },
            },
          }
        let(:property) {
          create(:dwelling, propertyReference: "000023")
        }
        let(:resident1) {
          create(:resident, dwelling: property)
        }
        let(:resident2) {
          create(:resident, dwelling: property)
        }
        let(:propertyReference) {
          property.propertyReference
        }
        before do
          resident1
          resident2
        end
        run_test! do |response|
          expect(response.body).to eq({
            residents: [resident1, resident2]
          }.to_json)
        end
      end

      response '404', 'invalid property reference' do
        let(:propertyReference) { 'invalid' }
        run_test!
      end
    end
  end

  path '/properties/{propertyReference}/repairs' do
    get 'Retrieves the repairs for a property' do
      tags 'Proposed'
      produces 'application/json'
      parameter name: :propertyReference, :in => :path, :type => :string

      response '200', 'properties found' do
        schema type: :object,
          properties: {
            residents: {
              type: :array,
              items: {
                '$ref' => '#/definitions/repair'
              },
            },
          }
        let(:property) {
          create(:dwelling, propertyReference: "000023")
        }
        let(:repair1) {
          create(:repair, propertyReference: propertyReference)
        }
        let(:repair2) {
          create(:repair, propertyReference: propertyReference)
        }
        let(:propertyReference) {
          property.propertyReference
        }
        before do
          repair1
          repair2
        end
        run_test! do |response|
          expect(response.body).to eq({
            repairs: [repair1, repair2]
          }.to_json)
        end
      end

      response '404', 'invalid property reference' do
        let(:propertyReference) { 'invalid' }
        run_test!
      end
    end
  end

  path '/properties/{propertyReference}/notes' do
    let(:property) {
      create(:dwelling, propertyReference: "000023")
    }
    let(:note1) {
      create(:note, target: property, text: 'Note 1')
    }
    let(:note2) {
      create(:note, target: property, text: 'Note 1')
    }
    let(:propertyReference) {
      property.propertyReference
    }
    before do
      note1
      note2
    end
    get 'Retrieves notes for a property' do
      tags 'Proposed'
      produces 'application/json'
      parameter name: :propertyReference, :in => :path, :type => :string

      response '200', 'property found' do
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

      response '404', 'property not found' do
        let(:propertyReference) { 'invalid' }
        run_test!
      end
    end

    post 'Creates an note for the property' do
      tags 'Proposed'
      consumes 'application/json'
      parameter name: :propertyReference, :in => :path, :type => :string
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
          expect(property.notes.last.text).to eq("Note contents")
        end
      end

      response '422', 'invalid request' do
        let(:note) { { beginDate: 1234 } }
        run_test!
      end
    end
  end
end
