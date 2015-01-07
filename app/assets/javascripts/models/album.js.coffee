Photobook.Album = DS.Model.extend Ember.Validations.Mixin,
  name: DS.attr('string')
  pages: DS.hasMany('page')

  validations:
    name:
      presence:
        message: 'Please enter a name.'

Photobook.AlbumSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    pages: { embedded: 'always' }
