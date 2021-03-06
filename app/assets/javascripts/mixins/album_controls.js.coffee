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

  QUOTE_JUSTIFY: [
    name: 'Left'
    value: null
  ,
    name: 'Right'
    value: 'right'
  ,
    name: 'Center'
    value: 'center'
  ]

  QUOTE_SIZE: [10..30]

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

  # TODO: Figure out why application route injection isn't working.
  LAYOUTS: (->
    @container.lookup('layouts:all')
  ).property()

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
