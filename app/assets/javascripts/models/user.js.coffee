Photobook.User = DS.Model.extend Ember.Validations.Mixin,
  name     : DS.attr('string')
  email    : DS.attr('string')
  password : DS.attr('string')

  validations:
    name:
      presence:
        message: "Please enter a name."
    email:
      presence:
        message: "Please enter an email."
    password:
      presence:
        message: "Please enter a password."

Photobook.UserSerializer = DS.RESTSerializer.extend
  serialize: (record, options) ->
    json = @_super.apply(this, arguments)
    delete json.password if Ember.isEmpty(json.password)
    json
