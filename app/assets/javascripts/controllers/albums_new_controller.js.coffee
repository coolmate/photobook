Photobook.AlbumsNewController = Ember.ObjectController.extend Photobook.ValidatedControllerMixin,
  actions:
    save: ->
      model = @get('model')
      @validate(model)
      .then => model.save()
      .then => @transitionToRoute 'album.edit', model
