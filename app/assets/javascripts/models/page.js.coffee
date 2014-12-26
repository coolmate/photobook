Photobook.Page = DS.Model.extend
  photos : DS.hasMany('photo')
  quotes : DS.hasMany('quote')
  album  : DS.belongsTo('album')
  layout : DS.attr('number')

Photobook.PageSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    photos: { embedded: 'always' }
    quotes: { embedded: 'always' }
