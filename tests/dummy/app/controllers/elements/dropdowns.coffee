import Controller from '@ember/controller'

DropdownsController = Controller.extend(

  actions:
    foo_foo: (x) ->
      console.log '* Action: ', x


    buttonClicked: ->
      console.log "button clicked"



)

export default DropdownsController
