`import Ember from 'ember'`
`import HasParent from 'ember-leaf-core/mixins/leaf-has-parent'`
`import layout from 'ember-leaf-core/templates/components/leaf-tab'`


LeafTabComponent = Ember.Component.extend(HasParent,
  layout: layout

  tagName: 'li'

  # fix the tabindex inserting a border

  attributeBindings: ['aria-controls', 'aria-expanded', 'aria-selected', 'role', 'selected', 'xxtabindex', 'active'],
  classNameBindings: ['active', 'hide']

  #
  #
  #
  mandatoryParent: true


  # Tells screenreaders which panel this tab controls.
  #
  # See http://www.w3.org/TR/wai-aria/states_and_properties#aria-controls
  #
  # @property aria-controls
  # @type String
  # @readOnly
  'aria-controls': Ember.computed.alias('parent.elementId')


  # Tells screenreaders whether or not this tab's panel is expanded.
  #
  # See http://www.w3.org/TR/wai-aria/states_and_properties#aria-expanded
  #
  # @property aria-expanded
  # @type String
  # @readOnly
  'aria-expanded': Ember.computed.alias('aria-selected')

  # Tells screenreaders whether or not this tab is selected.
  #
  # See http://www.w3.org/TR/wai-aria/states_and_properties#aria-selected
  #
  # @property aria-selected
  # @type String
  #
  'aria-selected': Ember.computed.alias('selected')

  #
  #
  #
  role: 'tab'

  #
  #
  #
  'tabindex': Ember.computed.alias('indexAsChild')

  #
  # true if this nav is active/selected
  #
  active: Ember.computed.alias('selected')

  #
  #
  #
  selectOnClick: (->
    @select()
  ).on('click', 'touchEnd')

)

`export default LeafTabComponent`
