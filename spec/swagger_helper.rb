require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.to_s + '/swagger'

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:to_swagger' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'Mock Hackney API',
        version: 'v1',
        description: "This is a working mock API of the Hackney API.
        It can be used for testing clients, or proposing future changes.
        DO NOT USE FOR REAL PERSONAL DATA.
        The source code is available at https://github.com/LBHackney-IT/mock_hackney_api"
      },
      basePath: '/hackneyrepairs/v1',
      paths: {},
      definitions: {
        repair_request: {
          type: :object,
          properties: {
            propertyReference: { type: :string, example: '000001', required: true },
            problemDescription: { type: :string, example: 'The fan is buzzing', required: true },
            priority: { type: :string, example: 'N', pattern: '^[UGINEZVMuginezvm]$', required: true },
            contact: {
              "$ref": '#/definitions/contact', required: true
            },
            work_orders: {
              type: :array,
              items: {
                "$ref": '#/definitions/work_order_request'
              },
            },
          },
        },
        repair: {
          type: :object,
          properties: {
            repairRequestReference: { type: :string },
            propertyReference: { type: :string, example: '000001' },
            problemDescription: { type: :string, example: 'The fan is buzzing' },
            priority: { type: :string, example: 'N' },
            contact: {
              "$ref": '#/definitions/contact'
            },
            work_orders: {
              type: :array,
              items: {
                "$ref": '#/definitions/work_order'
              },
            },
          },
        },
        contact: {
          type: :object,
          properties: {
            name: { type: :string, example: 'Jon Smith', required: true },
            telephoneNumber: { type: :string, example: '07777777777', required: true },
            emailAddress: { type: :string, example: 'test@test.com' },
            callbackTime: { type: :string, example: 'Morning' },
          },
        },
        work_order_request: {
          type: :object,
          properties: {
            sorCode: { type: :string, required: true },
          },
        },
        work_order: {
          type: :object,
          properties: {
            sorCode: { type: :string, example: '20040020' },
            supplierReference: { type: :string, example: 'W1' },
            workOrderReference: { type: :string, exmaple: '01234567' },
            estimatedCost: { type: :double, example: 10.50 },
            repairType: { type: :string, example: 'Community Hall Repairs' },
            status: { type: :string, example: 'Completed' },
            dueDate: { type: :string, example: '2018-06-18T09:00:00Z', format: 'date-time' },
            expectedCompletion: { type: :string, example: '2018-06-18T09:00:00Z', format: 'date-time' },
            attendedDate: { type: :string, example: '2018-06-18T09:00:00Z', format: 'date-time' },
            attendedBy: { type: :string, example: 'Geoff Smith' },
            outcome: { type: :string, example: 'Job Physically Complete' },
            cancelledDate: { type: :string, example: '2018-06-18T09:00:00Z', format: 'date-time' },
            tasks: {
              type: :array,
              items: {
                "$ref": '#/definitions/task'
              },
            },
          },
        },
        task: {
          type: :object,
          properties: {
            sorCode: { type: :string, example: '20040020' },
            dueDate: { type: :string, example: '2018-06-18T09:00:00Z', format: 'date-time' },
            supplierReference: { type: :string, example: 'W1' },
            estimatedCost: { type: :double, example: 10.50 },
            trade: { type: :string, example: 'SW' },
            completedDate: { type: :string, example: '2018-06-18T09:00:00Z', format: 'date-time' },
            description: { type: :string, example: '12 mm bitumen impregnated brds: laid ,loose' },
          },
        },
        appointment: {
          type: :object,
          properties: {
            beginDate: { type: :string, example: '2018-06-18T09:00:00Z', format: 'date-time' },
            endDate: { type: :string, example: '2018-06-18T10:00:00Z', format: 'date-time' },
          },
        },
        note: {
          type: :object,
          properties: {
            created: { type: :string },
            user: { type: :string },
            text: { type: :string }
          },
        },
        note_request: {
          type: :object,
          properties: {
            user: { type: :string },
            text: { type: :string }
          },
        },
      }
    }
  }
end
