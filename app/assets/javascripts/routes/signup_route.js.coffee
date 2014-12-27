Photobook.SignupRoute = Ember.Route.extend
  model: ->
    @store.createRecord('user')

  actions:
    signup: ->
      @modelFor(@routeName).save()

    login: ->
      $.post('/login',
        session:
          email: @modelFor(@routeName).get('email')
          password: @modelFor(@routeName).get('password')
      ).then (userData) =>
        @transitionTo('/')
