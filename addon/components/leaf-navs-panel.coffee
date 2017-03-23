`import Ember from 'ember'`
`import HasParent from 'ember-leaf-core/mixins/leaf-has-parent'`
`import layout from 'ember-leaf-core/templates/components/leaf-navs-panel'`

LeafNavsPanelComponent = Ember.Component.extend(HasParent,
  layout: layout

  tagName: 'div'
  classNames: ['tab-pane', 'animated', 'fadeIn', 'quick']

  attributeBindings: ['selected', 'active']
  classNameBindings: ['active:active']

  delayRender: Ember.computed.alias('parent.delay-render')

  rendered: ( ->
    if @get('delayRender')
      @get('active')
    else
      true
  ).property('delayRender', 'active')

  #
  #
  #
  mandatoryParent: true

  #
  # reference to the nav content item
  #
  'nav-content': null

  #
  # A reference to the parent children property.
  #
  # @property panels
  # @type Array
  #
  panels: Ember.computed.alias 'parent.children'


  #
  # true if this nav is active/selected
  #
  active: Ember.computed.alias('selected')

  #
  # true if this nav is currently selected.
  #
  # @property selected
  # @type Boolean
  #
  selected: (->
    @get('parent.selected') == this
  ).property('parent.selected')


)

`export default LeafNavsPanelComponent`
