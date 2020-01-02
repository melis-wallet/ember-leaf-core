import Component from '@ember/component'


ModalFooter = Component.extend(

  classNames: ['modal-footer']

  #
  # reference to the modal
  #
  modal: null

  #
  # Register the title within the modal
  # Note: Expects this title to be the direct descendant of the modal component
  #
  # @method registerInModal
  # @private
  #
  registerInModal: -> (
    if modal = @get('modal')
      modal.setHeader this
    else
      Ember.Logger.error "Modal Header needs a reference to the modal"
  ).on('init')

  actions:
    dismiss: ->
      modal.sendAction 'dismiss'

    confirm: (param) ->
      modal.sendAction 'confirm', param


)

export default ModalFooter
