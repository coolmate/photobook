Photobook.SignupController = Ember.Controller.extend
  signupUser: null
  loginUser: null

  init: ->
    @set('signupUser', @store.createRecord('user'))
    @set('loginUser', @store.createRecord('user'))

  deactivate: ->
    @get('signupUser').rollback()
    @set 'signupUser', null
    @get('loginUser').rollback()
    @set 'loginUser', null

  actions:
    signup: ->
      @get('signupUser').save().then =>
        @transitionTo('/albums').then ->
          Photobook.Window.reload()

    login: ->
      jQuery.ajax(
        type: 'POST'
        url: '/login'
        contentType: 'application/json'
        data: JSON.stringify(
          session:
            email: @get('loginUser').get('email')
            password: @get('loginUser').get('password')
        )
      ).then (userData) =>
        @transitionTo('/albums').then ->
          Photobook.Window.reload()
