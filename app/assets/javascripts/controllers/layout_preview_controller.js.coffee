Photobook.LayoutPreviewController = Ember.ObjectController.extend
  isSelected: (->
    @get('parentController.selectedLayout') is @get('id')
  ).property('parentController.selectedLayout', 'id')
