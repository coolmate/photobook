Photobook.ApplicationRoute = Ember.Route.extend
  model: ->
    layoutPromise = @store.find('layout').then (layout) =>
      @container.register('layouts:all', layout, {instantiate: false, singleton: true});
      @container.injection('controller', 'LAYOUTS', 'layouts:all')

    userPromise = jQuery.getJSON('/users/current').then (userData) =>
      if userData.user
        user = Ember.Object.create(userData.user)
        @container.register('user:current', user, {instantiate: false, singleton: true})
        @container.injection('route', 'currentUser', 'user:current')
        @container.injection('controller', 'currentUser', 'user:current')

    Ember.RSVP.all [layoutPromise, userPromise]

  actions:
    logout: ->
      $.ajax('/logout', type: 'DELETE').then =>
        @transitionTo('signup').then =>
          window.location.reload(true)
