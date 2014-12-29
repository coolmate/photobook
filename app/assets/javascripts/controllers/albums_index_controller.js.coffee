Photobook.AlbumsIndexController = Ember.ArrayController.extend
  actions:
    deleteAlbum: (album) ->
      console.log 'deleting album', album
