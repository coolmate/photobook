Photobook.Quote = DS.Model.extend
  page    : DS.belongsTo('page')
  content : DS.attr('string')
  justify : DS.attr('string')
  size    : DS.attr('number')
