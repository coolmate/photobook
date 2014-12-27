Photobook.ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      $.ajax('/logout', type: 'DELETE').then =>
        @transitionTo('signup')
