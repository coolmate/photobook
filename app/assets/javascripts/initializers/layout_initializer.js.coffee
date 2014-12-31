Ember.Application.initializer
  name: 'layoutsLoader'

  initialize: (container, application) ->
    application.deferReadiness()

    container.lookup('store:main').find('layout').then (layout) ->
        # Register the `layouts:all` namespace
        container.register('layouts:all', layout, {instantiate: false, singleton: true});

        # Inject the namespace into controllers and routes
        container.injection('route', 'LAYOUTS', 'layouts:all')
        container.injection('controller', 'LAYOUTS', 'layouts:all')

      # Continue the Application boot process, allowing other Initializers to run
      application.advanceReadiness()
