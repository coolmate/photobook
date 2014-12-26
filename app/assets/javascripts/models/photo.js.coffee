Photobook.Photo = DS.Model.extend
  page : DS.belongsTo('page', { async: true })
  url  : DS.attr('string')
