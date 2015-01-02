module 'albums',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'lists all albums when albums exist', ->
  expect 2

  respondWithUser @server
  respondWithAlbums @server, [
    { id: 1, name: "My Album One", pages: [] },
    { id: 2, name: "My Album Two", pages: [] },
    { id: 3, name: "My Album Three", pages: [] }
  ]
  visit '/albums'
  andThen ->
    equal find('.album-list .list-group-item').length, 3

  click 'a:contains(My Album Two)'
  andThen ->
    equal currentURL(), '/album/2/edit'

test 'shows a call to action when no albums exist', ->
  expect 3

  respondWithUser @server
  respondWithAlbums @server, []
  visit '/albums'
  andThen ->
    equal find('.album-list .list-group-item').length, 0
    equal find('.album-list').text().trim(),
        "You have no albums. Create an album!"

  click 'a:contains(Create an album)'
  andThen ->
    equal currentURL(), '/albums/new'
