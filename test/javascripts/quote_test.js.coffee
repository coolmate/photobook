withEmptyQuote = (server) ->
  respondWithAlbum server, { token: 'abcd1234', name: 'My Album', pages: [{
    album_id: 1
    layout: 1
    token: '4isy9Ozr1APFtFQEnNYPdQ'
    quotes: [{
      content: null
      id: 1
      justify: null
      page_id: 1
    }]
  }]}

module 'quote',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server
    respondWithUser @server

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'edit mode, with empty quote', ->
  expect 2

  withEmptyQuote(@server)

  visit '/album/abcd1234/edit'
  andThen =>
    ok find('.quote').hasClass('is-edit'), 'has edit class'
    ok find('.quote').hasClass('is-empty'), 'has empty class'

test 'view mode, with empty quote', ->
  expect 2

  withEmptyQuote(@server)

  visit '/album/abcd1234'
  andThen =>
    ok !find('.quote').hasClass('is-edit'), 'does not have edit class'
    ok find('.quote').hasClass('is-empty'), 'has empty class'
