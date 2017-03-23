`import Ember from 'ember'`
`import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'`
`import SizeSupport from 'ember-leaf-core/mixins/leaf-size-support'`
`import layout from 'ember-leaf-core/templates/components/leaf-button-group'`

LeafButtonGroupComponent = Ember.Component.extend(TypeSupport, SizeSupport,
  layout: layout

  classTypePrefix: ['btn-group']
  classNames: ['btn-group']
  classNameBindings: ['vertical:btn-group-vertical']
)

`export default LeafButtonGroupComponent`
