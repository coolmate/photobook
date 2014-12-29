Photobook.AlbumsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('album')

  actions:
    save: ->
      model = @modelFor(@routeName)
      model.save().then =>
        @transitionTo "album.edit", model
