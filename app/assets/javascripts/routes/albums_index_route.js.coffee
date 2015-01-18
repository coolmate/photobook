Photobook.AlbumsIndexRoute = Ember.Route.extend
  model: ->
    user = @container.lookup('user:current')
    @store.find('album', user_id: user.get('id'))
