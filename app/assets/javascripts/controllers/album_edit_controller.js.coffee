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

    deletePage: ->
      page = @get('currentPage')
      @send('goPrev') if @get('hasPrev')
      page.destroyRecord()

    openPhotoModal: (photo) ->
      @set('editingPhoto', photo)
      $('#photo-modal').fadeIn()

    openQuoteModal: (quote) ->
      @set('editingQuote', quote)
      $('#quote-modal').fadeIn()

    openLayoutModal: (quote) ->
      $('#layout-modal').fadeIn()

    closePhotoModal: ->
      @get('editingPhoto').rollback()
      $('#photo-modal').fadeOut()

    closeQuoteModal: ->
      @get('editingQuote').rollback()
      $('#quote-modal').fadeOut()

    closeLayoutModal: ->
      $('#layout-modal').fadeOut()

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
