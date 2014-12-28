Photobook.SignupController = Ember.Controller.extend
  signupUser: null
  loginUser: null

  init: ->
    @set('signupUser', @store.createRecord('user'))
    @set('loginUser', @store.createRecord('user'))

  actions:
    signup: ->
      @get('signupUser').save()

    login: ->
      $.post('/login',
        session:
          email: @get('loginUser').get('email')
          password: @get('loginUser').get('password')
      ).then (userData) =>
        @transitionTo('/')
