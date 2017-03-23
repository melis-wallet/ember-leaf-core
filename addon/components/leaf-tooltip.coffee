`import Ember from 'ember'`
`import TooltipSupport from 'ember-leaf-core/mixins/leaf-tooltip-support'`

LeafTooltipComponent = Ember.Component.extend(TooltipSupport,
  tagName: 'span'
)

`export default LeafTooltipComponent`
