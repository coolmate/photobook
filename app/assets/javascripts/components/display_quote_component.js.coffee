Photobook.DisplayQuoteComponent = Ember.Component.extend
  quote: null
  isEmpty: Ember.computed.not('quote.content')

  classNameBindings: ['quoteClassName', 'justifyClassName', 'isEmpty']
  quoteClassName: 'quote'
  justifyClassName: (->
    if justify = @get('quote.justify')
      "quote-justify-#{justify}"
    else
      ""
  ).property('quote.justify')

  click: ->
    @sendAction('action', @get('quote'))
