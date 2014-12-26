Photobook.Album = DS.Model.extend
  pages: DS.hasMany('page', { async: true })
