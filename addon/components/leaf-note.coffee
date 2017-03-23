`import Ember from 'ember'`
`import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'`
`import layout from 'ember-leaf-core/templates/components/leaf-note'`

LeafNoteComponent = Ember.Component.extend(TypeSupport,
  layout: layout

  tagName: 'section'
  classNames: ['note']

  classTypePrefix: 'note'
)

`export default LeafNoteComponent`
