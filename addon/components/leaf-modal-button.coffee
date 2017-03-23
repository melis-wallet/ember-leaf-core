`import LeafButton from 'ember-leaf-core/components/leaf-button'`
`import layout from 'ember-leaf-core/templates/components/leaf-modal-button'`

LeafModalButtonComponent = LeafButton.extend(
  layout: layout

  #
  # reference to the modal
  #
  modal: null

  dismiss: false

  #
  #
  #
  setup: -> (
    if !@get('modal')
      Ember.Logger.error "Modal Button needs a reference to the modal"
  ).on('init')



  click: (->
    if @get('dismiss')
       @get('modal').send('dismiss', @get('value'))
    else
      @get('modal').send('confirm', @get('value'))
    false
  )
)

`export default LeafModalButtonComponent`
