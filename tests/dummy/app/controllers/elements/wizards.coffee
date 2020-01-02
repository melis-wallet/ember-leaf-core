import Controller from '@ember/controller'
import { inject as service } from '@ember/service'

WizardsController = Controller.extend(


  modalManager: service('leaf-modals-manager')

  actions:
    openModalWizard: ->

      @get('modalManager').showModal('modal-wizard').then((res) =>
        console.log "promise return"
        console.log res
      ).catch( (res) ->
        console.log "promise reject"
        console.log res
      )
)

export default WizardsController
