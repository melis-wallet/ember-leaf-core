`import Ember from 'ember'`

ListViewController = Ember.Controller.extend(

  toastText: 'Hello, World!'
  toastType: 'info'
  toastLocation: 'bottom'
  toastStatus: 'passive'

  toastTypes: ['info', 'success', 'warn', 'error']
  toastLocations: ['bottom', 'top']
  toastStatuses: ['passive', 'persistent']

  actions:
    showToast: ->
      @get('toasts').queueToast({
          status: @get('toastStatus')
          location: @get('toastLocation')
          type: @get('toastType')
          message: @get('toastText')
        }, false)

    showError: ->
      @toasts.showError("Error!")

    showApiError: ->
      @toasts.showAPIError("Api Error!")

    closePassive: ->
      @toasts.showError("Error! Closes all the passives", closePassive: true)
)

`export default ListViewController`
