import Mixin from '@ember/object/mixin'
import { computed } from '@ember/object'
import { A } from '@ember/array'

import Logger from 'ember-leaf-core/utils/logger'

AsWizard = Mixin.create(
  completed: computed -> A()

  completeOn: null

  markCompleted: (step, new_step) ->
    step ||= @get('step')
    @get('completed').pushObject(step)
    @set('step', new_step) if new_step
    @trigger('stepComplete', step)

  markNotCompleted: (step) ->
    @get('completed').removeObject(step)

  clearCompleted: ->
    @set('completed', A())

  isComplete: (step) ->
    @get('completed').includes(step)

  wizardComplete: (->
    @get('completed').includes(@get('completeOn'))
  ).property('completed.[]')

  notifyComplete: (->
    if @get('wizardComplete')
      Logger.debug "- wizardComplete"
      @sendAction('on-wizard-complete')
  ).observes('wizardComplete')



)

export default AsWizard
