`import Ember from 'ember'`
`import HasChildren from 'ember-leaf-core/mixins/leaf-has-children'`
`import HasSelectableChildren from 'ember-leaf-core/mixins/leaf-has-selectable-children'`
`import ResizeTabdrop from 'ember-leaf-core/mixins/leaf-resize-tabdrop'`
`import SizeSupport from 'ember-leaf-core/mixins/leaf-size-support'`
`import layout from 'ember-leaf-core/templates/components/leaf-tabs-control'`

LeafTabsControlComponent = Ember.Component.extend(HasChildren, HasSelectableChildren, ResizeTabdrop, SizeSupport,
  layout: layout

  tagName: 'ul'
  classNames: ['nav', 'nav-tabs']
  classNameBindings: ['simple:nav-tabs-simple', 'justified:nav-justified']

  classTypePrefix: 'nav-tabs'

  attributeBindings: ['aria-multiselectable', 'role'],

  tabdrop: true

  #
  # simple style
  #
  simple: false


  #
  #
  #
  justified: false

  # Tells screenreaders that only one tab can be selected at a time.
  #
  # @property aria-multiselectable
  # @type String
  # @default false
  #
  'aria-multiselectable': false

  #
  # The `role` attribute of the tab list element.
  #
  # See http://www.w3.org/TR/wai-aria/roles#tablist
  #
  # @property role
  # @type String
  # @default 'tablist'
  #
  role: 'tablist',

  #
  # Gives focus to the selected tab.
  #
  # @method focusSelectedTab
  #
  focusSelectedTab: ->
    @get('selected').$().focus()

  navigateOnKeyDown: ((event)->
    switch event.keyCode
      # left, up
      when 37, 38 then @selectPreviousChild()
      # right, down
      when 39, 40 then @selectNextChild()

    event.preventDefault()
    Ember.run.scheduleOnce('afterRender', this, @focusSelectedTab);
  ).on('keyDown')


)

`export default LeafTabsControlComponent`
