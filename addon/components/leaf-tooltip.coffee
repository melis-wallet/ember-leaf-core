import Component from '@ember/component'
import TooltipSupport from 'ember-leaf-core/mixins/leaf-tooltip-support'

TooltipComponent = Component.extend(TooltipSupport,
  tagName: 'span'
)

export default TooltipComponent
