import LeafTab from 'ember-leaf-core/components/leaf-tab'
import layout from 'ember-leaf-core/templates/components/leaf-pill'

PillComponent = LeafTab.extend(
  layout: layout

  tagName: 'li'
)

export default PillComponent
