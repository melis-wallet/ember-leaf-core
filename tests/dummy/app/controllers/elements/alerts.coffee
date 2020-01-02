import Controller from '@ember/controller'

import LeafAlertable from 'ember-leaf-core/mixins/leaf-alertable'

AlertsController = Controller.extend(LeafAlertable,
  alTypes: ['info', 'success', 'warning', 'danger']

  alerts: []
  embAlerts: []
  disElementAlerts: []

  actions:
    addAlert: ->
      @get('alerts').pushObject(
        message: '<b>Oops</b> Something bad has happened!'
        type: 'warning'
        dismiss: true
      )
    addEmbAlert: ->
      @alertDanger '<b>Oops</b> Something very bad has happened!!', true

    addDisEmbAlert: ->
      @get('disElementAlerts').pushObject(
        message: '<b>Oops</b> Something bad has happened!'
        type: 'warning'
        dismiss: true
      )

)

export default AlertsController
