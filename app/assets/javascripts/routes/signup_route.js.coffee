Photobook.SignupRoute = Ember.Route.extend
  model: ->
    @store.createRecord('user')

  actions:
    save: ->
      @modelFor(@routeName).save()
