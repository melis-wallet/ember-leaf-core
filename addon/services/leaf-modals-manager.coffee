import Service from '@ember/service'
import { A } from '@ember/array'
import { get, set } from '@ember/object'
import RSVP from 'rsvp'
import { filterBy, alias } from '@ember/object/computed'

GLOBAL_ALERT_ID='global-alert'

ModalsManager = Service.extend(

  modals: A()

  activeModal: null
  exclusiveModals: true

  registerModal: (modal) ->
    modals = @get('modals')
    if modals.findBy('elementId', get(modal, 'elementId'))
      throw 'modal: duplicate elementId'
    else
      @get('modals').pushObject(modal)

  unregisterModal: (modal) ->
    @get('modals').removeObject(modal)
    if deferred = modal.get('deferred')
      deferred.reject('unregistered')

  showAlert: (data) ->
    modal = @get('modals').findBy('elementId', GLOBAL_ALERT_ID)
    if modal
      modal.setProperties(data)
      @showModal(GLOBAL_ALERT_ID)
    else
      console.log "no modal"
      RSVP.reject('global alert notfound')


  showModal: ((id) ->
    deferred = RSVP.defer()
    modal = @get('modals').findBy('elementId', id)
    if modal
      modal.set('deferred', deferred)
      modal.set('queued', true)
    else
      deferred.reject('notfound')

    return deferred.promise
  )

  hideModal: ((id, success) ->
    modal = @get('modals').findBy('elementId', id)
    if modal
      modal.setProperties
        active: false
        queued: false
      if deferred = modal.get('deferred')
        modal.set('deferred', null)
        if success
          deferred.resolve(success)
        else
          deferred.reject('closed')
  )

  queuedModals: filterBy('modals', 'queued', true)
  firstQueuedModal: alias('queuedModals.firstObject')

  queueChanged: (->
    if modal = @get('firstQueuedModal')
       @set('activeModal', modal)
       modal.set('active', true)
       modal.set('queued', false) if !@get('exclusiveModals')
     else
       @set 'activeModal', null
  ).observes('firstQueuedModal')

  setup: (->
    @get('queuedModals')
    @get('firstQueuedModal')
  ).on('init')

  modalClosed: (modal, valid, value)->
    @set('activeModal', null)
    modal.set('active', false)
    modal.set('queued', false)
    if deferred = modal.get('deferred')
      if valid
        deferred.resolve(value)
      else
        deferred.reject(value)
)

export default ModalsManager
