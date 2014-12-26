Photobook.DisplayPhotoComponent = Ember.Component.extend
  photo: null
  classNames: ['photo', 'photo-1'] # TODO: Quit hardcoding
  attributeBindings: ['style']

  style: (->
    "background-image: url(#{@get('photo.url')})"
  ).property('photo.url')
