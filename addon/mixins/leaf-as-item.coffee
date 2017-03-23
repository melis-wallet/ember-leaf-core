`import Ember from 'ember'`

#
# Indicate that the component is an item with a list.
#
AsItem = Ember.Mixin.create
  attributeBindings: ['active', 'disabled']
  classNameBindings: ['selectedClass']

  #
  # A reference to the {{#crossLink "List"}}List{{/crossLink}} instance.
  #
  # @property list
  # @type List
  #
  list: null

  #
  # Get the index of this item within the list
  #
  # @property index
  # @type int
  #
  index: (->
    @get('list.items').indexOf this
  ).property 'list.items.[]'

  #
  # Register this item in the {{#crossLink "List"}}List{{/crossLink}} component instance.
  #
  # @method register
  # @private
  #
  register: (->
    @get('list').addItem this
  ).on 'didInsertElement'

  #
  # Unregister this item from the {{#crossLink "List"}}List{{/crossLink}} component instance.
  #
  # @method unregister
  # @private
  #
  unregister: (->
    @get('list').removeItem this
  ).on 'willDestroyElement'

  #
  # Select this item.
  #
  # Bound to `click` event.
  #
  # @method select
  #
  select: (->
    @get('list').select this
  ).on 'click'

  selectedClass: (->
    if @get('selected')
      @get('list.selectedClass')
    else null
  ).property 'selected'

  #
  # true if this item is currently selected.
  #
  # @property selected
  # @type Boolean
  #
  selected: (->
    @get('list.selected') is this
  ).property('list.selected')

  active: (->
    if @get('selected') then "true" else null
  ).property('selected')

  setup: (->
    unless @get('list')
      Ember.Logger.error "List item needs a list passed"
  ).on('init')

`export default AsItem`
