Photobook.AlbumControls = Ember.Mixin.create
  LAYOUTS:
    1:
      numPhotos: 2
    2:
      numPhotos: 1
  DEFAULT_LAYOUT: 1

  albumClassNames: (->
    "js-page layout-#{@get('currentPage.layout')}"
  ).property('currentPage.layout')

  currentPageNum: 0

  currentPage: (->
    @get('model.pages').objectAt(@get('currentPageNum'))
  ).property('model.pages.[]', 'currentPageNum')

  hasNext: (->
    @get('model.pages.length') > @get('currentPageNum') + 1
  ).property('model.pages.length', 'currentPageNum')

  hasPrev: Ember.computed.gt('currentPageNum', 0)

  actions:
    goNext: ->
      $('.js-page').fadeOut().promise().done =>
        @incrementProperty('currentPageNum')
        $('.js-page').fadeIn()

    goPrev: ->
      $('.js-page').fadeOut().promise().done =>
        @decrementProperty('currentPageNum')
        $('.js-page').fadeIn()

    goEnd: ->
      $('.js-page').fadeOut().promise().done =>
        @set('currentPageNum', @get('model.pages.length') - 1)
        $('.js-page').fadeIn()
