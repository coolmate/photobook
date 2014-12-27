Ember.Handlebars.helper 'layout-preview', (numPhotos, layoutNum, options) ->
  # This inline HTML is terrible, but there's no way to pass blocks into bound
  # helpers.
  outputHTML = "<div class='layout-#{layoutNum}'>"
  for i in [1..numPhotos]
    outputHTML += "<div class='photo is-empty'></div>"
  outputHTML += "</div>"
  new Handlebars.SafeString(outputHTML)
