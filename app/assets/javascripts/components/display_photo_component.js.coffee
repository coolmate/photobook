Photobook.DisplayPhotoComponent = Ember.Component.extend
  photo: null
  isEmpty: Ember.computed.not('photo.url')

  classNameBindings: ['photoClassName', 'shapeClassName', 'isEmpty']
  photoClassName: 'photo'
  shapeClassName: (->
    if shape = @get('photo.shape')
      "photo-#{shape}"
    else
      ""
  ).property('photo.shape')

  attributeBindings: ['style']
  style: (->
    "background-image: url(#{@get('photo.url')})"
  ).property('photo.url')

  click: ->
    @sendAction('action', @get('photo'))
