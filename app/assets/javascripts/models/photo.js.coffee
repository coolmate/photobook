Photobook.Photo = DS.Model.extend
  page  : DS.belongsTo('page')
  url   : DS.attr('string')
  shape : DS.attr('string')
