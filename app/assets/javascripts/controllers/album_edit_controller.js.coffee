Photobook.AlbumEditController = Ember.ObjectController.extend Photobook.AlbumControls,
  actions:
    newPage: ->
      return unless @get('isLoaded')
      page = @store.createRecord('page', layout: @DEFAULT_LAYOUT, album: @get('model'))
      for i in [1..@LAYOUTS[@DEFAULT_LAYOUT].numPhotos]
        @store.createRecord('photo', page: page)
      @send('goEnd')
