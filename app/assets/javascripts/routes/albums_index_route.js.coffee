Photobook.AlbumsIndexRoute = Ember.Route.extend
  model: ->
    @store.find('album')
