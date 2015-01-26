Photobook.AlbumRoute = Ember.Route.extend
  actions:
    error: (error, transition) ->
      @transitionTo('album_error') if error?.status is 404
