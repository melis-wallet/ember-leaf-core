import Component from '@ember/component'

import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'
import layout from 'ember-leaf-core/templates/components/leaf-note'

NoteComponent = Component.extend(TypeSupport,
  layout: layout

  tagName: 'section'
  classNames: ['note']

  classTypePrefix: 'note'
)

export default NoteComponent
