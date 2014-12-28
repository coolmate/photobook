Photobook.Album = DS.Model.extend
  name: DS.attr('string')
  pages: DS.hasMany('page')

Photobook.AlbumSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    pages: { embedded: 'always' }
