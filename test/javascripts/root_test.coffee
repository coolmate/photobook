module 'root',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'when logged out', ->
  expect 1

  @server.respondWith 'GET', '/users/current', JSON.stringify({})
  visit '/'
  andThen ->
    equal currentURL(), '/signup', 'goes to signup page'

test 'when logged in', ->
  expect 1

  respondWithUser @server
  respondWithAlbums @server
  visit '/'
  andThen ->
    equal currentURL(), '/albums', 'goes to albums page'
