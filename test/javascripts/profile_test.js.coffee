module 'profile',
  setup: ->
    @server = sinon.fakeServer.create()
    @server.autoRespond = yes
    respondWithLayouts @server
    respondWithUser @server
    respondWithAlbums @server, []

  teardown: ->
    @server.restore()
    Photobook.reset()

test 'viewing profile', ->
  expect 2

  visit '/profile'
  andThen ->
    equal findInputByLabel('Name').val(), 'Test User', 'shows name'
    equal findInputByLabel('Email').val(), 'test@example.com', 'shows email'

test 'updating profile, no new password', ->
  expect 2

  @server.respondWith 'PUT', '/users/1', JSON.stringify(user: {
    id: 1
    name: 'New Name'
    email: 'newemail@example.com'
  })

  visit '/profile'
  fillInByLabel 'Name', 'New Name'
  fillInByLabel 'Email', 'newemail@example.com'
  click 'button:contains(Save)'
  andThen =>
    hasRequest @server, 'PUT', '/users/1',
      user:
        name: 'New Name'
        email: 'newemail@example.com'
    hasSuccessMessage 'Profile saved successfully.'

test 'updating profile, new password', ->
  expect 2

  @server.respondWith 'PUT', '/users/1', JSON.stringify(user: {
    id: 1
    name: 'Test User'
    email: 'test@example.com'
    password: 'newpassword'
  })

  visit '/profile'
  fillInByLabel 'New Password', 'newpassword'
  click 'button:contains(Save)'
  andThen =>
    hasRequest @server, 'PUT', '/users/1',
      user:
        name: 'Test User'
        email: 'test@example.com'
        password: 'newpassword'
    hasSuccessMessage 'Profile saved successfully.'

test 'validations', ->
  expect 2

  visit '/profile'
  fillInByLabel 'Email', ''
  click 'button:contains(Save)'
  andThen =>
    hasWarningMessage 'Please enter an email.'

  fillInByLabel 'Name', ''
  click 'button:contains(Save)'
  andThen =>
    hasWarningMessage 'Please enter a name.'
