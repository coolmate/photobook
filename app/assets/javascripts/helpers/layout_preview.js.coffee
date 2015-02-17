Ember.Handlebars.helper 'layout-preview', (numPhotos, numQuotes, layoutNum, options) ->
  # This inline HTML is terrible, but there's no way to pass blocks into bound
  # helpers.
  outputHTML = "<div class='layout-#{layoutNum}'>"
  for i in [0..numPhotos-1]
    outputHTML += "<div class='photo is-empty is-preview'></div>"
  for i in [0..numQuotes-1]
    outputHTML += "<div class='quote is-empty is-preview'></div>"
  outputHTML += "</div>"
  new Handlebars.SafeString(outputHTML)
