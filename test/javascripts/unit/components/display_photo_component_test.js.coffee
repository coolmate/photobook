module 'Unit DisplayPhotoComponent',
  teardown: ->
    $(Photobook.rootElement).empty()

test '#setImageSizeToCover with a wide image', ->
  expect 2

  $(Photobook.rootElement).append '
    <div id="boxEl" style="width: 50px; height: 50px;">
      <div id="photoEl" style="width: 100px; height: 70px;">
    </div>
  '
  component = Photobook.DisplayPhotoComponent.create()
  photoEl = find('#photoEl')
  component.setImageSizeToCover(find('#boxEl'), photoEl)

  equal component.get('coverWidth'), 'auto', 'maintains width ratio'
  equal component.get('coverHeight'), '100%', 'stretches height'

test '#setImageSizeToCover with a tall image', ->
  expect 2

  $(Photobook.rootElement).append '
    <div id="boxEl" style="width: 50px; height: 50px;">
      <div id="photoEl" style="width: 70px; height: 100px;">
    </div>
  '
  component = Photobook.DisplayPhotoComponent.create()
  photoEl = find('#photoEl')
  component.setImageSizeToCover(find('#boxEl'), photoEl)

  equal component.get('coverWidth'), '100%', 'stretches width'
  equal component.get('coverHeight'), 'auto', 'maintains height ratio'
