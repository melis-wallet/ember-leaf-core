`import Ember from 'ember'`


AlertableMixin = Ember.Mixin.create(
  elementAlerts: Ember.computed -> Ember.A()


  alertInfo: (message, dismiss) ->
    @showAlert(message: message, type: 'alert', dismiss: dismiss)

  alertSuccess: (message, dismiss) ->
    @showAlert(message: message, type: 'success', dismiss: dismiss)

  alertWarning: (message, dismiss) ->
    @showAlert(message: message, type: 'warn', dismiss: dismiss)

  alertDanger: (message, dismiss) ->
    @showAlert(message: message, type: 'danger', dismiss: dismiss)

  showAlert: (options) ->
    @get('elementAlerts').pushObject(options)

  closeAllAlerts: ->
    @get('elementAlerts').clear()

  closeAlert: (alert) ->
    @get('elementAlerts').removeObject(alert)

)

`export default AlertableMixin`