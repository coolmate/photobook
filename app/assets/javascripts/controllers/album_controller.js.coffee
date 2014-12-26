Photobook.AlbumController = Ember.ObjectController.extend
  albumClassNames: (->
    "js-page layout-#{@get('currentPage.layout')}"
  ).property('currentPage.layout')

  currentPageNum: 0

  currentPage: (->
    @get('model.pages').objectAt(@get('currentPageNum'))
  ).property('model.pages.[]', 'currentPageNum')

  hasNext: (->
    @get('model.pages.length') > @get('currentPageNum')
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
