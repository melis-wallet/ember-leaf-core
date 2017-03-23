`import Ember from 'ember'`
`import AsItem from 'ember-leaf-core/mixins/leaf-as-item'`

LeafListItemComponent = Ember.Component.extend(AsItem,
  tagName: 'li'
  classNames: ['list-group-item']
)

`export default LeafListItemComponent`
