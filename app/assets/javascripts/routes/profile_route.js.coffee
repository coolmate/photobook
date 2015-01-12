Photobook.ProfileRoute = Ember.Route.extend
  model: ->
    @container.lookup('user:current')

  deactivate: ->
    @modelFor(@routeName).rollback()
