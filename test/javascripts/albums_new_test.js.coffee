module 'albums new',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'creating a new album', ->
  expect 3

  respondWithUser @server
  respondWithAlbums @server, []

  request =
    name: 'My Album'
    pages: []
    token: null
  @server.respondWith 'POST', '/albums',
    JSON.stringify(album: { token: 3, name: request.name, pages: request.pages })

  visit '/albums/new'
  click 'button:contains(Create Album)'
  andThen =>
    hasWarningMessage 'Please enter a name.'

  fillIn '#album-name', 'My Album'
  click 'button:contains(Create Album)'
  andThen =>
    hasRequest @server, 'POST', '/albums', album: request
    equal currentURL(), '/album/3/edit', 'redirects to the new album'
