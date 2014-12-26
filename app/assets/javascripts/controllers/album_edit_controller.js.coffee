Photobook.AlbumEditController = Ember.ObjectController.extend Photobook.AlbumControls,
  editingPhoto: null
  editingQuote: null

  actions:
    newPage: ->
      return unless @get('isLoaded')
      page = @store.createRecord('page', layout: @DEFAULT_LAYOUT, album: @get('model'))
      for i in [1..@LAYOUTS[@DEFAULT_LAYOUT].numPhotos]
        @store.createRecord('photo', page: page)
      for i in [1..@LAYOUTS[@DEFAULT_LAYOUT].numQuotes]
        @store.createRecord('quote', page: page)
      @send('goEnd')

    openPhotoModal: (photo) ->
      @set('editingPhoto', photo)
      $('.js-photo-modal').fadeIn()

    openQuoteModal: (quote) ->
      @set('editingQuote', quote)
      $('.js-quote-modal').fadeIn()

    closePhotoModal: ->
      $('.js-photo-modal').fadeOut()

    closeQuoteModal: ->
      $('.js-quote-modal').fadeOut()

    savePhotoModal: ->
      @get('editingPhoto').save()
      @send('closePhotoModal')

    saveQuoteModal: ->
      @get('editingQuote').save()
      @send('closeQuoteModal')
