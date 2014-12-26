Photobook.AlbumController = Ember.ObjectController.extend
  currentPageNum: 0

  currentPage: (->
    @get('model.pages')?[@get('currentPageNum')]
  ).property('model.pages.[]', 'currentPageNum')

  hasNext: (->
    @get('model.pages.length') > @get('currentPageNum')
  ).property('model.pages.length', 'currentPageNum')

  hasPrev: Ember.computed.gt('currentPageNum', 0)

  actions:
    goNext: -> @incrementProperty('currentPageNum')
    goPrev: -> @decrementProperty('currentPageNum')
