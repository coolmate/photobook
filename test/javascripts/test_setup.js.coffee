Ember.Test.registerHelper 'respondWithUser', (app, server) ->
  server.respondWith 'GET', '/users/current', JSON.stringify({
    user: { id: 1, name: 'Test User', email: 'test@example.com' }
  })

Ember.Test.registerHelper 'respondWithLayouts', (app, server) ->
  server.respondWith 'GET', '/layouts', JSON.stringify({ layouts: [] })

Ember.Test.registerHelper 'respondWithAlbums', (app, server, albums=[]) ->
  server.respondWith 'GET', '/albums', JSON.stringify({ albums: albums })
