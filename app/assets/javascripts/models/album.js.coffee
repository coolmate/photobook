Photobook.Album = DS.Model.extend
  pages: DS.hasMany('page')

Photobook.AlbumSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    pages: { embedded: 'always' }
