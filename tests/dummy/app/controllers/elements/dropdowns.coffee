`import Ember from 'ember'`

DropdownsController = Ember.Controller.extend(

  actions:
    foo_foo: (x) ->
      console.log '* Action: ', x


    buttonClicked: ->
      console.log "button clicked"



)
`export default DropdownsController`
