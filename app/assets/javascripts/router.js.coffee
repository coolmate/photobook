# For more information see: http://emberjs.com/guides/routing/

Photobook.Router.map ()->
  @resource 'albums', ->
    @route 'new'
  @resource 'album', { path: 'album/:album_id' }, ->
    @route 'edit'
  @route 'signup'
  @route 'profile'
