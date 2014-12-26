Photobook.DisplayPhotoComponent = Ember.Component.extend
  photo: null

  classNameBindings: ['photoClassName', 'shapeClassName', 'borderClassName']
  photoClassName: 'photo'
  shapeClassName: (->
    if shape = @get('photo.shape')
      "photo-#{shape}"
    else
      ""
  ).property('photo.shape')
  borderClassName: (->
    if @get('photo.url')
      ""
    else
      "is-empty"
  ).property('photo.url')

  attributeBindings: ['style']
  style: (->
    "background-image: url(#{@get('photo.url')})"
  ).property('photo.url')

  click: ->
    @sendAction('action', @get('photo'))
