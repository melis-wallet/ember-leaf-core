`import Ember from 'ember'`
`import HasChildren from 'ember-leaf-core/mixins/leaf-has-children'`
`import HasSelectableChildren from 'ember-leaf-core/mixins/leaf-has-selectable-children'`
`import TypeSupport from '../mixins/leaf-type-support'`
`import layout from 'ember-leaf-core/templates/components/leaf-accordion'`

LeafAccordionComponent = Ember.Component.extend(HasChildren, HasSelectableChildren, TypeSupport,
  layout: layout

  tagName: 'section'
  classNames: 'panel-group'

  classTypePrefix: 'panel-group'
)

`export default LeafAccordionComponent`
