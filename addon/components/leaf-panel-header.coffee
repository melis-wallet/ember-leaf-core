import Component from '@ember/component'

import layout from 'ember-leaf-core/templates/components/leaf-panel-header'

PanelHeader = Component.extend(
  layout: layout

  classNames: ['panel-heading']
)

export default PanelHeader
