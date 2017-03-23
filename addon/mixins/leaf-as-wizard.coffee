`import Ember from 'ember'`

AsWizard = Ember.Mixin.create(
  completed: Ember.computed -> Ember.A()

  completeOn: null

  markCompleted: (step, new_step) ->
    step ||= @get('step')
    @get('completed').pushObject(step)
    @set('step', new_step) if new_step
    @trigger('stepComplete', step)

  markNotCompleted: (step) ->
    @get('completed').removeObject(step)

  clearCompleted: ->
    @set('completed', Ember.A())

  isComplete: (step) ->
    @get('completed').includes(step)

  wizardComplete: (->
    @get('completed').includes(@get('completeOn'))
  ).property('completed.[]')

  notifyComplete: (->
    if @get('wizardComplete')
      Ember.Logger.debug "- wizardComplete"
      @sendAction('on-wizard-complete')
  ).observes('wizardComplete')



)

`export default AsWizard`
