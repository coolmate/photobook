Ember.Test.registerHelper 'findInputByLabel', (app, label) ->
  find "label:contains(#{label}) + div input"

Ember.Test.registerHelper 'fillInByLabel', (app, label, value) ->
  fillIn "label:contains(#{label}) + div input", value

Ember.Test.registerHelper 'containsText', (app, element, text) ->
  ok element.text().trim().indexOf(text) >= 0, "shows '#{text}'"
