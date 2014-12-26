# For more information see: http://emberjs.com/guides/routing/

Photobook.Router.map ()->
  @resource 'albums'
  @resource 'album', { path: '/album/:album_id' }, ->
    @route('edit')
