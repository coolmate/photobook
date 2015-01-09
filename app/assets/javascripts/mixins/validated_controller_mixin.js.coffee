Photobook.ValidatedControllerMixin = Ember.Mixin.create
  displayError: null

  # Calls `validate` on the given model.
  # If invalid, sets `displayError` to the validation error message.
  # Returns a promise that succeeds when the model validates.
  validate: (model) ->
    model.validate().then(=>
      @set 'displayError', null
      Ember.RSVP.Promise.resolve(model)
    ).catch((error) =>
      for own key, value of model.get('errors')
        if value.length > 0
          @set 'displayError', value[0]
          break
      Ember.RSVP.Promise.reject()
    )
