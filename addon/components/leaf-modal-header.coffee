import Component from '@ember/component'

import layout from 'ember-leaf-core/templates/components/leaf-modal-header'

ModalHeader = Component.extend(
  layout: layout

  classNames: ['modal-header']

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

)

export default ModalHeader