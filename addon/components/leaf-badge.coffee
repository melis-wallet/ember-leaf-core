import Component from '@ember/component'
import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'
import layout from 'ember-leaf-core/templates/components/leaf-badge'

BadgeComponent = Component.extend(TypeSupport,
  layout: layout

  tagName: 'span'

  classNames: ['badge']
  classTypePrefix: 'badge'
)

export default BadgeComponent
