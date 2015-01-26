module 'album',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server
    respondWithUser @server

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'edit mode, loading a nonexistent album', ->
  expect 1

  @server.respondWith('GET', '/albums/test', [404, {}, ''])

  visit '/album/1234/edit'
  andThen =>
    containsText find('h2'), "Sorry, we couldn't find that album."

test 'view mode, loading a nonexistent album', ->
  expect 1

  @server.respondWith('GET', '/albums/abcd1234', [404, {}, ''])

  visit '/album/abcd1234'
  andThen =>
    containsText find('h2'), "Sorry, we couldn't find that album."

test 'edit mode, loading an album with no pages', ->
  expect 1

  respondWithAlbum @server, { token: 'abcd1234', name: 'My Album', pages: [] }

  visit '/album/abcd1234/edit'
  andThen =>
    containsText find('.page-empty'), 'Click "+Page" to get started!'

test 'view mode, loading an album with no pages', ->
  expect 1

  respondWithAlbum @server, { token: 'abcd1234', name: 'My Album', pages: [] }

  visit '/album/abcd1234'
  andThen =>
    containsText find('.page-empty'), 'No pages to view.'
