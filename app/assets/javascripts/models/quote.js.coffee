Photobook.Quote = DS.Model.extend
  page    : DS.belongsTo('page', { async: true })
  content : DS.attr('string')
