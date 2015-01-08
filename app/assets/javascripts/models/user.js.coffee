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
