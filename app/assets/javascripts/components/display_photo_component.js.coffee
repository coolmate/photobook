Photobook.DisplayPhotoComponent = Ember.Component.extend
  photo: null
  isEmpty: Ember.computed.not('photo.url')
  isEdit: no

  # If the tag is a link, open the photo in a lightbox on click.
  attributeBindings: (->
    if @get('tagName') is 'a' then ['href', 'data-lightbox'] else []
  ).property('tagName')
  href: Ember.computed.alias('photo.url')
  'data-lightbox': Ember.computed.alias('photo.id')

  # Either '100%' or 'auto'. Set by `setImageSizeToCover`.
  coverWidth: null
  coverHeight: null

  photoUrlChanged: (->
    return unless @get('photo.url')

    photoEl = @$('img')
    photoEl.one 'load', =>
      @setImageSizeToCover $(@element), photoEl
      @enableImageDragging photoEl
      photoEl.addClass('is-loaded')
  ).observes('photo.url').on('didInsertElement')

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

    # Only allow dragging along the axis that isn't stretched to full width.
    axis = if @get('coverWidth') is '100%' then 'y' else 'x'

    photoEl.draggable
      axis: axis
      stop: (event, info) =>
        leftPx = Math.floor(info.position.left)
        topPx = Math.floor(info.position.top)

        @set('photo.offsetLeft', leftPx)
        @set('photo.offsetTop', topPx)

        @get('photo').save()
