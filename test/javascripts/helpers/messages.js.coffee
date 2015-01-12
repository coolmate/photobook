Ember.Test.registerHelper 'hasNoWarningMessage', (app, message) ->
  equal find('.alert-danger').length, 0, 'shows no warning messages'

Ember.Test.registerHelper 'hasWarningMessage', (app, message) ->
  equal find('.alert-danger').text().trim(), message, 'shows a warning message'

Ember.Test.registerHelper 'hasSuccessMessage', (app, message) ->
  equal find('.alert-success').text().trim(), message, 'shows a success message'
