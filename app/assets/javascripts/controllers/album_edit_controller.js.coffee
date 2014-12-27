Photobook.AlbumEditController = Ember.ObjectController.extend Photobook.AlbumControls,
  LAYOUTS: [
    numPhotos: 2
    numQuotes: 2
    id: 1
  ,
    numPhotos: 1
    numQuotes: 0
    id: 2
  ]

  editingPhoto   : null
  editingQuote   : null
  selectedLayout : 1

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
        layout: @get('selectedLayout')
        album: @get('model')
      )
      page.save().then =>
        @send('closeLayoutModal')
        @send('goEnd')

    selectLayout: (layout) ->
      @set('selectedLayout', layout)
