Photobook.DisplayQuoteComponent = Ember.Component.extend
  quote: null

  classNameBindings: ['quoteClassName', 'borderClassName']
  quoteClassName: 'quote'
  borderClassName: (->
    if @get('quote.content')
      ""
    else
      "is-empty"
  ).property('quote.content')

  click: ->
    @sendAction('action', @get('quote'))
