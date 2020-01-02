import Component from '@ember/component'
import { alias } from '@ember/object/computed'

import HasParent from 'ember-leaf-core/mixins/leaf-has-parent'
import layout from 'ember-leaf-core/templates/components/leaf-wizard-step'

WizardStep = Component.extend(HasParent,
  layout: layout

  tagName: 'li'
  selectable: false
  classNameBindings: ['completed', 'active', 'hide']

  #
  #
  #
  mandatoryParent: true


  #
  # true if this nav is active/selected
  #
  active: alias('selected')

  #
  #
  #
  completed: (->
    @get('parent.completed-steps').includes(@get('idx')) if @get('parent')
  ).property('parent.completed-steps.[]', 'idx')


  actions:
    stepTo: ->
      if @get('completed') && (parent = @get('parent'))
        parent.stepTo(this)

)

export default WizardStep
