Photobook.RibbonNavComponent = Ember.Component.extend
  classNameBindings: ['ribbonClassName', 'buttonClassName']
  ribbonClassName: 'ribbon'
  click: -> @sendAction()
