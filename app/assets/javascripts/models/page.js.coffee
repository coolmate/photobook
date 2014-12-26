Photobook.Page = DS.Model.extend
  photos : DS.hasMany('photo', { async: true })
  quotes : DS.hasMany('quote', { async: true })
  album  : DS.belongsTo('album', { async: true })
  layout : DS.attr('number')
