import Component from '@ember/component'

import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'
import layout from 'ember-leaf-core/templates/components/leaf-label'

LabelComponent = Component.extend(TypeSupport,
  layout: layout

  tagName: 'span'

  tag: false

  classNames: ['label']
  classNameBindings: ['label-tag:label-tag']

  classTypePrefix: 'label'
)

export default LabelComponent
