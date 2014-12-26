Photobook.DisplayQuoteComponent = Ember.Component.extend
  quote: null
  isEmpty: Ember.computed.not('quote.content')

  classNameBindings: ['quoteClassName', 'isEmpty']
  quoteClassName: 'quote'

  click: ->
    @sendAction('action', @get('quote'))
