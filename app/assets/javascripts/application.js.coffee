#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require photobook

# for more details see: http://emberjs.com/guides/application/
window.Photobook = Ember.Application.create()

$(->
  token = $('meta[name="csrf-token"]').attr('content')
  $.ajaxPrefilter((options, originalOptions, xhr)->
    xhr.setRequestHeader('X-CSRF-Token', token)
  )
)

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
