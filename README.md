# Mock Hackney API

This project aims to be a 'working' mock equivalent of Hackney API.

It can be used for rapid testing of clients of the API.

I can also be used for testing and documenting proposed changes to the real API.

## Current status

This is being developed by DXW as part of the RCC Alpha work. For that reason,
it is focussing on Hackney API endpoints relating to Universal Housing.

If it proves to be useful to other teams, then hopefully it will become a good
practice for the development of Hackney API as a whole.

## Installation

Requires ruby, bundler and postgresql installed.

- `git clone`
- `bundle install`
- `rails s`

You can view the swagger documentation (which allows you to make API calls) at
http://localhost:3000/api-docs/index.html

There is an instance running at https://mock-hackney-api.herokuapp.com/api-docs/index.html

## Personal data

This mock API allows us to develop without the use of personal data, which
allows faster development outside of protected environments.
However, it is therefore vital that you do not allow personal data to be stored
in any instance of this Mock API that is not within a protected environment.

If using this for user testing, please ensure testers know to write their
scripts appropriately, and to inform participants of this.

## Contributing

Pull requests encouraged!

To propose a change to the API, please ensure that there is a working endpoint
in the application, and equally importantly that there are tests and swagger
documentation.

This project uses [rswag](https://github.com/domaindrivendev/rswag) to do both
at the same time. See `spec/integration/repairs_spec.rb` for an example.

You may also want to look at `spec/swagger_helper.rb` to see where swagger
objects are defined.

Once you have working specs, run `rake rswag:specs:swaggerize` to generate new
swagger documentation and include that in your pull request.
