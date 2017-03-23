`import Ember from 'ember'`

ButtonController = Ember.Controller.extend(
  btnTypes: ['default', 'primary', 'info', 'success', 'warning', 'danger']

  count: 0

  btnActive: false

  actions:
    #
    increment: ->
      @set('count', @get('count') + 1)

    #
    submitDelayed: (deferred, value) ->

      Ember.run.later( (->
        deferred.resolve('done')
      ), 2000)
      false

    #
    submitDelayedFail: (deferred, value) ->

      Ember.run.later( (->
        deferred.reject 'Error!'
      ), 2000)
      false

    #
    toggle: ->

      active = @get('btnActive')
      if active
        console.log 'off'
        @set('btnActive', false)
      else
        console.log 'on'
        @set('btnActive', true)
      false

)
`export default ButtonController`
