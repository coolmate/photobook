Photobook.Quote = DS.Model.extend
  page    : DS.belongsTo('page')
  content : DS.attr('string')
