Photobook.IndexRoute = Ember.Route.extend
  beforeModel: ->
    if @container.lookup('user:current')
      @transitionTo('albums')
    else
      @transitionTo('signup')
