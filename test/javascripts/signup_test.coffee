module 'signup',
  setup: ->
    @server = sinon.fakeServer.create()
    @windowSpy = Photobook.Window.reload = sinon.spy()
    @server.autoRespond = yes
    respondWithLayouts @server
    respondWithAlbums @server
    @server.respondWith 'GET', '/users/current', JSON.stringify({})

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'allows signing up', ->
  expect 3

  request =
    name: 'Finn the Human'
    email: 'finn@example.com'
    password: 'mAtheMatical!'
  @server.respondWith 'POST', '/users',
    JSON.stringify({ name: request.name, email: request.email })

  visit '/signup'
  fillIn '.form-signup input[placeholder=Name]', request.name
  fillIn '.form-signup input[placeholder=Email]', request.email
  fillIn '.form-signup input[placeholder=Password]', request.password
  click '.btn:contains(Sign Up)'
  andThen =>
    hasRequest @server, 'POST', '/users', user: request
    equal currentURL(), '/albums'
    ok @windowSpy.called

test 'allows logging in', ->
  expect 3

  request =
    email: 'finn@example.com'
    password: 'mAtheMatical!'
  @server.respondWith 'POST', '/login',
    JSON.stringify({ email: request.email, password: request.password })
  visit '/signup'
  fillIn '.form-login input[placeholder=Email]', request.email
  fillIn '.form-login input[placeholder=Password]', request.password
  click '.btn:contains(Log In)'
  andThen =>
    hasRequest @server, 'POST', '/login', session: request
    equal currentURL(), '/albums'
    ok @windowSpy.called
