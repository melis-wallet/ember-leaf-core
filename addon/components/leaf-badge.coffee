`import Ember from 'ember'`
`import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'`
`import layout from 'ember-leaf-core/templates/components/leaf-badge'`

LeafBadgeComponent = Ember.Component.extend(TypeSupport,
  layout: layout

  tagName: 'span'

  classNames: ['badge']
  classTypePrefix: 'badge'
)

`export default LeafBadgeComponent`
