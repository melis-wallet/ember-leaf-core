import Controller from '@ember/controller'
import { inject as service } from '@ember/service'
import { later } from '@ember/runloop'

AlertsController = Controller.extend(
  alTypes: ['info', 'success', 'warning', 'danger']

  modalManager: service('leaf-modals-manager')

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


    openMultiModal: ->
      i = 0
      ['test-mm-1', 'test-mm-2', 'test-mm-3'].forEach((m) =>
        later(@, (->
          @get('modalManager').showModal(m).then((res) ->
            console.log "promise returned: ", m, res
          ).catch((e) ->
            console.log "Rejected", m, e
          )
        ), (1000 * i++))
      )



    openModal: (modal)->

      @get('modalManager').showModal(modal).then((res) ->
        console.log "promise returned: ", res
      ).catch( (e) ->
        console.log "Rejected", e
      )

)

export default AlertsController
