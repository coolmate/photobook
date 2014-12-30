Photobook.IndexRoute = Ember.Route.extend
  beforeModel: ->
    if @get('currentUser')
      @transitionTo('albums')
    else
      @transitionTo('signup')
