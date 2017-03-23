`import Ember from 'ember'`

AlertsController = Ember.Controller.extend(
  alTypes: ['info', 'success', 'warning', 'danger']

  modalManager: Ember.inject.service('leaf-modals-manager')

  actions:
    setOpenModal: ->
      @set('openModal', true)

    danger: ->
      @get('modalManager').showModal('danger')
    warning: ->
      @get('modalManager').showModal('warning')
    success: ->
      @get('modalManager').showModal('success')
    info: ->
      @get('modalManager').showModal('info')


    simpleAlert: (type) ->
      console.log "showing", type
      @get('modalManager').showAlert(
        type: type
        title: 'Alert title'
        caption: 'Alert caption'
      ).then((res) ->
        console.log "Closed: ", res
      ).catch((e) ->
        console.log "Rejected: ", e
      )




    openModal: (modal)->

      @get('modalManager').showModal(modal).then((res) ->
        console.log "promise returned: ", res
      ).catch( (e) ->
        console.log "Rejected", e
      )

)
`export default AlertsController`
