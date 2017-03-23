`import Ember from 'ember'`

TooltipsController = Ember.Controller.extend(

  showHidden: false

  actions:
    toggleHidden: ->
      @toggleProperty('showHidden')
      false

)
`export default TooltipsController`
