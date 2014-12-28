Photobook.ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      $.ajax('/logout', type: 'DELETE').then =>
        @transitionTo('signup').then =>
          window.location.reload(true)
