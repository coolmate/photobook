Photobook.SignupController = Ember.Controller.extend(
    Photobook.ValidatedControllerMixin,
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
      @validateModel(user)
      .then => user.save()
      .then => @transitionToRoute('/albums')
      .then -> Photobook.Window.reload()

    login: ->
      user = @get('loginUser')
      @validateModel(user)
      .then(=>
        jQuery.ajax(
          type: 'POST'
          url: '/login'
          contentType: 'application/json'
          data: JSON.stringify(
            session:
              email: user.get('email')
              password: user.get('password')
          )
        )
      ).then (userData) => @transitionToRoute('/albums')
      .then -> Photobook.Window.reload()

  validations:
    name:
      presence:
        message: "Please enter a name."
    email:
      presence:
        message: "Please enter an email."
    password:
      presence:
        message: "Please enter a password."
)
