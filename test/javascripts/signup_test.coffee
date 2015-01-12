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
  expect 6

  request =
    name: 'Finn the Human'
    email: 'finn@example.com'
    password: 'mAtheMatical!'
  @server.respondWith 'POST', '/users',
    JSON.stringify(user: { name: request.name, email: request.email })

  visit '/signup'

  click '.btn:contains(Sign Up)'
  andThen =>
    hasWarningMessage 'Please enter a name.'

  fillIn '.form-signup input[placeholder=Name]', request.name
  click '.btn:contains(Sign Up)'
  andThen =>
    hasWarningMessage 'Please enter an email.'

  fillIn '.form-signup input[placeholder=Email]', request.email
  click '.btn:contains(Sign Up)'
  andThen =>
    hasWarningMessage 'Please enter a password.'

  fillIn '.form-signup input[placeholder=Password]', request.password
  click '.btn:contains(Sign Up)'
  andThen =>
    hasRequest @server, 'POST', '/users', user: request
    equal currentURL(), '/albums', 'goes to the albums page'
    ok @windowSpy.called, 'reloads the page'

test 'allows logging in', ->
  expect 5

  request =
    email: 'finn@example.com'
    password: 'mAtheMatical!'
  @server.respondWith 'POST', '/login',
    JSON.stringify(user: { email: request.email, password: request.password })

  visit '/signup'
  click '.btn:contains(Log In)'
  andThen =>
    hasWarningMessage 'Please enter an email.'

  fillIn '.form-login input[placeholder=Email]', request.email
  click '.btn:contains(Log In)'
  andThen =>
    hasWarningMessage 'Please enter a password.'

  fillIn '.form-login input[placeholder=Password]', request.password
  click '.btn:contains(Log In)'
  andThen =>
    hasRequest @server, 'POST', '/login', session: request
    equal currentURL(), '/albums', 'goes to the albums page'
    ok @windowSpy.called, 'reloads the page'
