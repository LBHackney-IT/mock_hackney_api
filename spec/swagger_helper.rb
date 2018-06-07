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
      paths: {},
      definitions: {
        repair: {
          type: :object,
          properties: {
            repairRequestReference: { type: :string },
            propertyReference: { type: :string },
            problemDescription: { type: :string, example: 'The fan is buzzing' },
            priority: { type: :string },
            contact: { "$ref": '#/definitions/contact' }
          }
        },
        contact: {
          type: :object,
          properties: {
            name: { type: :string },
            telephoneNumber: { type: :string },
            emailAddress: { type: :string },
            callbackTime: { type: :string },
          }
        }
      }
    }
  }
end
