Photobook.ProfileController = Ember.ObjectController.extend(
    Ember.Validations.Mixin, Photobook.ValidatedControllerMixin,
  displaySuccess: null

  actions:
    save: ->
      model = @get('model')
      @validateModel(this)
      .then => model.save()
      .then => @set 'displaySuccess', 'Profile saved successfully.'
      .catch => @set 'displaySuccess', null

  validations:
    name:
      presence:
        message: "Please enter a name."
    email:
      presence:
        message: "Please enter an email."
)
