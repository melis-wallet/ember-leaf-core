`import Ember from 'ember'`
`import AsWizard from 'ember-leaf-core/mixins/leaf-as-wizard'`

TestWizardComponent = Ember.Component.extend(AsWizard,

  step: 1
  completeOn: 5

  actions:
    'complete-step': (value) ->
      @markCompleted(value)
      @set('step', value + 1)

)
`export default TestWizardComponent`