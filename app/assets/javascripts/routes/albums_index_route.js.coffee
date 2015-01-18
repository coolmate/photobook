Photobook.AlbumsIndexRoute = Ember.Route.extend
  beforeModel: ->
    user = @container.lookup('user:current')
    @transitionTo('signup') unless user

  model: ->
    user = @container.lookup('user:current')
    @store.find('album', user_id: user.get('id'))
