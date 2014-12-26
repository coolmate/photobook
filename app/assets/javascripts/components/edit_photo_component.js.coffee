Photobook.EditPhotoComponent = Ember.Component.extend
  photo: null
  classNames: ['photo', 'is-edit']
  attributeBindings: ['style']

  style: (->
    if @get('photo.url')
      "background-image: url(#{@get('photo.url')})"
    else
      ""
  ).property('photo.url')
