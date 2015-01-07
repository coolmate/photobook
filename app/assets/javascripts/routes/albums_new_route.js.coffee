Photobook.AlbumsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('album')

  deactivate: ->
    @modelFor(@routeName).rollback()
