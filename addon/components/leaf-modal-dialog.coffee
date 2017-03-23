`import Ember from 'ember'`
`import SimpleAnimations from 'ember-leaf-core/mixins/leaf-simple-animations'`
`import SizeSupport from 'ember-leaf-core/mixins/leaf-size-support'`
`import layout from 'ember-leaf-core/templates/components/leaf-modal-dialog'`


LeafModalDialogComponent = Ember.Component.extend(SimpleAnimations, SizeSupport,
  layout: layout

  classNames: ['modal-dialog']

  'animation-quick': true

  classTypePrefix: 'modal'

  #
  # reference to the modal, passed by the template
  #
  modal: null

  'in-animation': (->
    if @get('modal.bottom')
      'fadeInUp'
    else
      'fadeInDown'
  ).property('modal.bottom')

  'out-animation': (->
    if @get('modal.bottom')
      'fadeOutDown'
    else
      'fadeOutUp'
  ).property('modal.bottom')



  register: (->
      @set('modal.dialog', @)
  ).on('init')
)

`export default LeafModalDialogComponent`
