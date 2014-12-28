Photobook.AlbumsRoute = Ember.Route.extend
  model: ->
    @store.find('album')
