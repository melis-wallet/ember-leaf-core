import Component from '@ember/component'
import { inject as service } from '@ember/service'
import { scheduleOnce } from '@ember/runloop'


ModalTrigger = Component.extend(

  mm: service('leaf-modals-manager')

  'modal-id': null
  'when-inserted': false

  'modal-trigger': false

  triggered: false

  showModal: (id) ->

    if id && !@get('triggered')
      @set('triggered', true)

      @get('mm').showModal(id).then((res) =>
        @sendAction('on-modal-success', res)
      ).catch((e) =>
        @sendAction('on-modal-failure', e)
      ).finally(=>
        @set('triggered', false)
      )

  triggerChanged: ( ->

    if @get('modal-trigger') && (modal = @get('modal-id'))
      @showModal(modal)
  ).observes('modal-trigger')

  #
  #
  #
  setup: ( ->
    @get('modal-trigger')
    return unless @get('when-inserted')
    if modal = @get('modal-id')
      scheduleOnce('afterRender', this, =>
        @showModal(modal)
      )
  ).on('didInsertElement')

)

export default ModalTrigger
