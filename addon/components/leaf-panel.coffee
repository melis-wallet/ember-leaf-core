import Component from '@ember/component'

import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'
import StyleBindings from 'ember-leaf-core/mixins/leaf-style-bindings'
import layout from 'ember-leaf-core/templates/components/leaf-panel'

PanelComponent = Component.extend(TypeSupport, StyleBindings,
  layout: layout

  tagName: 'section'
  classNames: ['panel']
  classNameBindings: ['dark:panel-dark', 'colorful:panel-body-colorful']
  classTypePrefix: 'panel'

  click: ->
    @sendAction('on-click')
)

export default PanelComponent
