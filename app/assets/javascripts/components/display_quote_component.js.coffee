DEFAULT_FONT_SIZE_PX = 16;

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

  attributeBindings: ['style']
  style: (->
      size = @get('quote.size') || DEFAULT_FONT_SIZE_PX;
      "font-size: #{size}px"
  ).property('quote.size')

  click: ->
    @sendAction('action', @get('quote'))
