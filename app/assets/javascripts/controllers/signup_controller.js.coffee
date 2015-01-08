Photobook.SignupController = Ember.Controller.extend
  displayError: null
  signupUser: null
  loginUser: null

  init: ->
    @set('signupUser', @store.createRecord('user'))
    @set('loginUser', @store.createRecord('user', name: 'Placeholder Name'))

  deactivate: ->
    @get('signupUser').rollback()
    @set 'signupUser', null
    @get('loginUser').rollback()
    @set 'loginUser', null

  actions:
    signup: ->
      user = @get('signupUser')
      user.validate().then(=>
        @set 'displayError', null
        user.save().then =>
          @transitionToRoute('/albums').then ->
            Photobook.Window.reload()
      ).catch(=>
        for own key, value of user.get('errors')
          if value.length > 0
            @set 'displayError', value[0]
            return
      )

    login: ->
      user = @get('loginUser')
      user.validate().then(=>
        @set 'displayError', null
        jQuery.ajax(
          type: 'POST'
          url: '/login'
          contentType: 'application/json'
          data: JSON.stringify(
            session:
              email: user.get('email')
              password: user.get('password')
          )
        ).then (userData) =>
          @transitionToRoute('/albums').then ->
            Photobook.Window.reload()
      ).catch(=>
        for own key, value of user.get('errors')
          if value.length > 0
            @set 'displayError', value[0]
            return
      )
