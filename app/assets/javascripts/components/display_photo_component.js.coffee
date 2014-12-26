Photobook.DisplayPhotoComponent = Ember.Component.extend
  photo: null
  classNames: ['photo']
  attributeBindings: ['style']

  style: (->
    "background-image: url(#{@get('photo.url')})"
  ).property('photo.url')
