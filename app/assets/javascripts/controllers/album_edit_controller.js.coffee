Photobook.AlbumEditController = Ember.ObjectController.extend Photobook.AlbumControls,
  editingPhoto: null
  editingQuote: null

  actions:
    newPage: ->
      return unless @get('isLoaded')
      @send('openLayoutModal')

    openPhotoModal: (photo) ->
      @set('editingPhoto', photo)
      $('.js-photo-modal').fadeIn()

    openQuoteModal: (quote) ->
      @set('editingQuote', quote)
      $('.js-quote-modal').fadeIn()

    openLayoutModal: (quote) ->
      $('.js-layout-modal').fadeIn()

    closePhotoModal: ->
      @get('editingPhoto').rollback()
      $('.js-photo-modal').fadeOut()

    closeQuoteModal: ->
      @get('editingQuote').rollback()
      $('.js-quote-modal').fadeOut()

    closeLayoutModal: ->
      $('.js-layout-modal').fadeOut()

    savePhotoModal: ->
      @get('editingPhoto').save()
      @send('closePhotoModal')

    saveQuoteModal: ->
      @get('editingQuote').save()
      @send('closeQuoteModal')

    saveLayoutModal: ->
      page = @store.createRecord('page',
        layout: @DEFAULT_LAYOUT,
        album: @get('model')
      )
      page.save().then =>
        @send('closeLayoutModal')
        @send('goEnd')
