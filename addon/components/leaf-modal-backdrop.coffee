import Component from '@ember/component'

import SimpleAnimations from 'ember-leaf-core/mixins/leaf-simple-animations'

ModalBackDrop = Component.extend(SimpleAnimations,

  classNames: ['modal-backdrop']

  'animation-quick': true

  #
  # reference to the modal, passed by the template
  #
  modal: null

  'in-animation': (->
    if @get('modal.bottom')
      'fadeInDown'
    else
      'fadeInUp'
  ).property('modal.bottom')

  'out-animation': (->
    if @get('modal.bottom')
      'fadeOutUp'
    else
      'fadeOutDown'
  ).property('modal.bottom')



  register: (->
    @set('modal.backdrop', @)
  ).on('init')


  click: ->
    @sendAction('on-click')
)

export default ModalBackDrop
