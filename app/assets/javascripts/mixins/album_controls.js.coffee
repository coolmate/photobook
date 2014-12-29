Photobook.AlbumControls = Ember.Mixin.create
  PHOTO_SHAPES: [
    name: 'Square'
    value: null
  ,
    name: 'Rounded corners'
    value: 'rounded'
  ,
    name: 'Oval'
    value: 'oval'
  ]

  albumClassNames: (->
    "js-page layout-#{@get('currentPage.layout')}"
  ).property('currentPage.layout')

  currentPageNum: 0

  currentPage: (->
    return null unless @get('model.pages.length') > 0
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

        # TODO: This shouldn't be necessary, but the album doesn't refresh
        # when there are no pages to begin with.
        window.location.reload(true)

        $('.js-page').fadeIn()
