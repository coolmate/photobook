module 'navigation',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'when logged out', ->
  expect 3

  @server.respondWith 'GET', '/users/current', JSON.stringify({})
  visit '/'
  andThen ->
    equal currentURL(), '/signup', 'root routes to signup page'

    equal find('.navbar-nav a').text(), 'Login', 'shows login link'
    equal find('.navbar-nav a').attr('href'), '/signup', 'shows login link'

test 'when logged in', ->
  expect 9

  respondWithUser @server
  respondWithAlbums @server
  visit '/'
  andThen ->
    equal currentURL(), '/albums', 'root routes to albums page'

    leftLinks = find('.navbar-nav').eq(0).find('a')
    equal leftLinks.eq(0).text(), 'My Albums', 'shows albums link'
    equal leftLinks.eq(0).attr('href'), '/albums', 'shows albums link'
    equal leftLinks.eq(1).text(), '+Album', 'shows new album link'
    equal leftLinks.eq(1).attr('href'), '/albums/new', 'shows albums link'

    rightLinks = find('.navbar-nav .dropdown')
    equal rightLinks.find('.dropdown-toggle').text().trim(), 'Test User',
        'shows a user dropdown'
    equal rightLinks.find('.dropdown-menu a').eq(0).text(), 'Profile',
        'shows a profile dropdown link'
    equal rightLinks.find('.dropdown-menu a').eq(0).attr('href'), '/profile',
        'shows a profile dropdown link'
    equal rightLinks.find('.dropdown-menu a').eq(1).text(), 'Logout',
        'shows a logout dropdown link'
