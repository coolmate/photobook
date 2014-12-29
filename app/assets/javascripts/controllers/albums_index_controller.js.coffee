Photobook.AlbumsIndexController = Ember.ArrayController.extend
  actions:
    deleteAlbum: (album) ->
      if confirm("Are you sure you want to delete this album?")
        album.destroyRecord()
