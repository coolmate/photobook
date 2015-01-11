Ember.Test.registerHelper 'findInputByLabel', (app, label) ->
  find "label:contains(#{label}) + div input"

Ember.Test.registerHelper 'fillInByLabel', (app, label, value) ->
  fillIn "label:contains(#{label}) + div input", value
