module 'album',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server
    respondWithUser @server

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'edit mode, loading an album with no pages', ->
  expect 1

  respondWithAlbum @server, { id: 1, name: 'My Album', pages: [] }

  visit '/album/1/edit'
  andThen =>
    containsText find('.page-empty'), 'Click "+Page" to get started!'

test 'view mode, loading an album with no pages', ->
  expect 1

  respondWithAlbum @server, { id: 1, name: 'My Album', pages: [] }

  visit '/album/1'
  andThen =>
    containsText find('.page-empty'), 'No pages to view.'
