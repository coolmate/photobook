Photobook.AlbumsNewController = Ember.ObjectController.extend
  displayError: null

  actions:
    save: ->
      album = @get('model')
      album.validate().then(=>
        @set 'displayError', null
        album.save().then =>
          @transitionToRoute 'album.edit', album
      ).catch(=>
        for own key, value of album.get('errors')
          if value.length > 0
            @set 'displayError', value[0]
            return
      )
