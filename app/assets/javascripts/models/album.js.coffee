Photobook.Album = DS.Model.extend Ember.Validations.Mixin,
  token : DS.attr('string')
  name  : DS.attr('string')
  pages : DS.hasMany('page')

  validations:
    name:
      presence:
        message: 'Please enter a name.'

Photobook.AlbumSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,
  primaryKey: 'token'
  attrs:
    pages: { embedded: 'always' }
