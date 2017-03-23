`import Ember from 'ember'`
`import layout from 'ember-leaf-core/templates/components/leaf-panel-header'`

LeafPanelHeaderComponent = Ember.Component.extend(
  layout: layout

  classNames: ['panel-heading']
)

`export default LeafPanelHeaderComponent`
