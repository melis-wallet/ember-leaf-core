
import { alias } from '@ember/object/computed'
import { scheduleOnce } from '@ember/runloop';

import LeafPanel from 'ember-leaf-core/components/leaf-panel'
import HasParent from 'ember-leaf-core/mixins/leaf-has-parent'
import layout from 'ember-leaf-core/templates/components/leaf-accordion-panel'

AccordionPanel = LeafPanel.extend(HasParent,
  layout: layout

  classNameBindings: ['selected:selected_class']
  attributeBindings: ['active']

  body: true

  #
  #
  #
  mandatoryParent: true

  #
  # true if this nav is active/selected
  #
  active: alias('selected')


  actions:
    selectPanel: ->
      @toggleSelect()
)

export default AccordionPanel
