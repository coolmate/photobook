Photobook.DisplayPhotoComponent = Ember.Component.extend
  photo: null
  isEmpty: Ember.computed.not('photo.url')
  isEdit: no

  # Either '100%' or 'auto'. Set by `setImageSizeToCover`.
  coverWidth: null
  coverHeight: null

  didInsertElement: ->
    @_super()
    return unless @get('photo.url')

    photoEl = @$('img')
    photoEl.load => # Runs every time the photo URL is changed.
      @setImageSizeToCover $(@element), photoEl
      @enableImageDragging photoEl

  classNameBindings: ['photoClassName', 'shapeClassName', 'isEmpty', 'isEdit']
  photoClassName: 'photo'
  shapeClassName: (->
    if shape = @get('photo.shape')
      "photo-#{shape}"
    else
      ""
  ).property('photo.shape')

  imgStyle: (->
    "width: #{@get('coverWidth')}; height: #{@get('coverHeight')};
     left: #{@get('photo.offsetLeft')}px; top: #{@get('photo.offsetTop')}px"
  ).property('coverWidth', 'coverHeight', 'photo.offsetLeft', 'photo.offsetTop')

  # Essentially implements the `background-size: cover` style of sizing.
  setImageSizeToCover: (boxEl, photoEl) ->
    boxRatio = boxEl.width() / boxEl.height()
    photoRatio = photoEl.width() / photoEl.height()

    if boxRatio > photoRatio
      @set 'coverWidth', '100%'
      @set 'coverHeight', 'auto'
    else
      @set 'coverWidth', 'auto'
      @set 'coverHeight', '100%'

  enableImageDragging: (photoEl) ->
    return unless @get('isEdit')

    # TODO: Constrain dragging
    photoEl.draggable
      stop: (event, info) =>
        leftPx = Math.floor(info.position.left)
        topPx = Math.floor(info.position.top)

        @set('photo.offsetLeft', leftPx)
        @set('photo.offsetTop', topPx)

        @get('photo').save()
