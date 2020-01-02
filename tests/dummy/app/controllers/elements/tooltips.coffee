import Controller from '@ember/controller'

TooltipsController = Controller.extend(

  showHidden: false

  actions:
    toggleHidden: ->
      @toggleProperty('showHidden')
      false

)

export default TooltipsController
