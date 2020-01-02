import Component from '@ember/component'
import { alias } from '@ember/object/computed'

import HasChildren from 'ember-leaf-core/mixins/leaf-has-children'
import HasSelectableChildren from 'ember-leaf-core/mixins/leaf-has-selectable-children'
import TypeSupport from '../mixins/leaf-type-support'

import layout from 'ember-leaf-core/templates/components/leaf-accordion'

AccordionComponent = Component.extend(HasChildren, HasSelectableChildren, TypeSupport,
  layout: layout

  tagName: 'section'
  classNames: 'panel-group'

  classTypePrefix: 'panel-group'

  'allow-unselect': true

  'allow-close': alias('allow-unselect')
)

export default AccordionComponent
