Ember.Application.initializer
  name: 'currentUserLoader'

  initialize: (container, application) ->
    application.deferReadiness()

    $.get('users/current').then (userData) ->
      if userData.user
        user = Ember.Object.create(userData.user)

        # Register the `user:current` namespace
        container.register('user:current', user, {instantiate: false, singleton: true})

        # Inject the namespace into controllers and routes
        container.injection('route', 'currentUser', 'user:current')
        container.injection('controller', 'currentUser', 'user:current')

      # Continue the Application boot process, allowing other Initializers to run
      application.advanceReadiness()
