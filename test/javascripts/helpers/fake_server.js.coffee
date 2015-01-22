Ember.Test.registerHelper 'respondWithUser', (app, server) ->
  server.respondWith 'GET', '/users/current', JSON.stringify({
    user: { id: 1, name: 'Test User', email: 'test@example.com' }
  })

Ember.Test.registerHelper 'respondWithLayouts', (app, server) ->
  server.respondWith 'GET', '/layouts', JSON.stringify({ layouts: [] })

Ember.Test.registerHelper 'respondWithAlbums', (app, server, albums=[]) ->
  server.respondWith 'GET', '/albums?user_id=1', JSON.stringify({ albums: albums })

Ember.Test.registerHelper 'respondWithAlbum', (app, server, album) ->
  server.respondWith 'GET', "/albums/#{album.id}", JSON.stringify({ album: album })

Ember.Test.registerHelper 'hasRequest', (app, server, method, url, data) ->
  requests = server.requests
    .filterBy('method', method)
    .filterBy('url', url)
  throw "No such request: #{method}, #{url}" unless requests.length > 0
  deepEqual JSON.parse(requests[0].requestBody), data,
    'makes a request to the server'
