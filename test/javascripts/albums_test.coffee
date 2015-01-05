module 'albums',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'when albums exist', ->
  expect 2

  respondWithUser @server
  respondWithAlbums @server, [
    { id: 1, name: "My Album One", pages: [] },
    { id: 2, name: "My Album Two", pages: [] },
    { id: 3, name: "My Album Three", pages: [] }
  ]
  visit '/albums'
  andThen ->
    equal find('.album-list .list-group-item').length, 3, 'shows all albums'

  click 'a:contains(My Album Two)'
  andThen ->
    equal currentURL(), '/album/2/edit', 'goes to the edit album page'

test 'when no albums exist', ->
  expect 5

  respondWithUser @server
  respondWithAlbums @server, []
  visit '/albums'
  andThen ->
    equal find('.album-list .list-group-item').length, 0, 'shows no albums'
    equal find('.album-list').text().trim(),
        'You have no albums. Create an album!', 'shows a call to action'

  click 'a:contains(Create an album)'
  andThen ->
    equal currentURL(), '/albums/new', 'goes to the new album page'

  request =
    name: 'My Album'
    pages: []
  @server.respondWith 'POST', '/albums',
    JSON.stringify(album: { id: 3, name: request.name, pages: request.pages })

  fillIn '#album-name', 'My Album'
  click 'button:contains(Create Album)'
  andThen =>
    hasRequest @server, 'POST', '/albums', album: request
    equal currentURL(), '/album/3/edit', 'redirects to the new album'
