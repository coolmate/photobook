module 'photo',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server
    respondWithUser @server

    respondWithAlbum @server, { token: 'abcd1234', name: 'My Album', pages: [{
      album_id: 1
      layout: 1
      token: 'PcuqxE4IxeLl8n4tfJsDPg'
      photos: [{
        id: 49
        page_id: 1
        url: 'http://localhost/test.png'
        shape: null
        offset_left: 0
        offset_top: 0
      }]
    }]}

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'edit mode', ->
  expect 2

  visit '/album/abcd1234/edit'
  andThen =>
    photoElem = find('.photo')
    equal photoElem.find('img').attr('src'), 'http://localhost/test.png', 'displays the image'
    equal photoElem.prop('tagName'), 'DIV', 'does not open in the lightbox'

test 'view mode', ->
  expect 4

  visit '/album/abcd1234'
  andThen =>
    photoElem = find('.photo')
    equal photoElem.find('img').attr('src'), 'http://localhost/test.png', 'displays the image'
    equal photoElem.prop('tagName'), 'A', 'opens in the lightbox'
    equal photoElem.attr('href'), 'http://localhost/test.png', 'sets href for lightbox'
    equal photoElem.attr('data-lightbox'), '49', 'sets data-lightbox for lightbox'
