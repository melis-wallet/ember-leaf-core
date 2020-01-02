import Component from '@ember/component'
import AsWizard from 'ember-leaf-core/mixins/leaf-as-wizard'

TestWizard = Component.extend(AsWizard,

  step: 1
  completeOn: 5

  actions:
    'complete-step': (value) ->
      @markCompleted(value)
      @set('step', value + 1)

)

export default TestWizard