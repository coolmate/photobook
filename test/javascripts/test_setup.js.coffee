Ember.Test.registerHelper 'respondWithUser', (app, server) ->
  server.respondWith 'GET', '/users/current', JSON.stringify({
    user: { id: 1, name: 'Test User', email: 'test@example.com' }
  })

Ember.Test.registerHelper 'respondWithLayouts', (app, server) ->
  server.respondWith 'GET', '/layouts', JSON.stringify({ layouts: [] })

Ember.Test.registerHelper 'respondWithAlbums', (app, server, albums=[]) ->
  server.respondWith 'GET', '/albums', JSON.stringify({ albums: albums })

Ember.Test.registerHelper 'hasRequest', (app, server, method, url, data) ->
  requests = server.requests
    .filterBy('method', method)
    .filterBy('url', url)
  throw "No such request: #{method}, #{url}" unless requests.length > 0
  deepEqual JSON.parse(requests[0].requestBody), data,
    'makes a request to the server'

Ember.Test.registerHelper 'hasNoWarningMessage', (app, message) ->
  equal find('.alert-danger').length, 0, 'shows no warning messages'

Ember.Test.registerHelper 'hasWarningMessage', (app, message) ->
  equal find('.alert-danger').text().trim(), message, 'shows a warning message'

Ember.Test.registerHelper 'findInputByLabel', (app, label) ->
  find "label:contains(#{label}) + div input"

Ember.Test.registerHelper 'fillInByLabel', (app, label, value) ->
  fillIn "label:contains(#{label}) + div input", value
