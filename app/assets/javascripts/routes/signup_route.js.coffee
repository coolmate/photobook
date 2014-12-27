Photobook.SignupRoute = Ember.Route.extend
  model: ->
    @store.createRecord('user')

  actions:
    signup: ->
      @modelFor(@routeName).save()
