import Component from '@ember/component'
import { inject as service } from '@ember/service'
import { scheduleOnce, schedule } from '@ember/runloop'
import RSVP from 'rsvp'

import StyleBindings from 'ember-leaf-core/mixins/leaf-style-bindings'
import layout from 'ember-leaf-core/templates/components/leaf-modal'

ModalComponent = Component.extend(StyleBindings,
  layout: layout


  classNames: ['modal']
  classNameBindings: ['dark:modal-dark', 'styleOpeningClasses', 'bottom:modal-bottom']
  attributeBindings: ['is-open', 'did-open', 'tabindex']

  styleBindings: ['display']

  #
  # reference to the modal manager
  #
  manager: service('leaf-modals-manager')


  #
  # Define the tabindex DOM property.
  # Required otherwise no keyDown events
  # @property tabindex
  #
  tabindex: 0

  #
  # modal can be dismissed clicking on the backdrop
  #
  'backdrop-dismiss': true

  #
  # modal can be dismissed clicking on the X
  #
  'x-dismiss': true

  #
  # modal is queued for display
  #
  queued: false

  #
  # if true, should toggle and show
  #
  active: false

  #
  # Consumer can bind this property for a more fine grained control over when the modal is opened,
  # This is good for situations where openning the modal via the `toggler` is not enough.
  #
  #
  'open-if': false

  #
  # Consumer can bind this property for a more fine grained control over when the modal is closed,
  # This is good for situations where closing the modal via the `toggler` is not enough.
  #
  'close-if': false


  #
  # `show` property is bound to the DOM element as an attribute.
  # This property is set to true immediately when the `toggleVisibility` method is invoked.
  #
  # This property can be used to start a transitioning effect
  # The transition effect should be ended when the modal is gets visible, see the property `shown` for more info.
  #
  'is-open': false


  #
  # A property bound to the DOM element that indicates that the modal has been made visible to the user.
  # (after the DOM element was set with `display: block;`)
  #
  # This proeprty can be used by CSS to end a transitioning effect by setting the CSS `opacity` to a higher number, for example:
  #
  #
  'did-open': false

  #
  # actions
  #
  actions:

    #
    # a dismiss button has been clicked (or esc, or the x), will reject the promise
    #
    dismiss: (value)->
      @close(false, value)

    #
    # a confirm button has been clicked
    #
    confirm: (value) ->
      @close(true, value)

    #
    # the backdrop has been clicked, reject the promise if
    #
    backdropClicked: ->
      @close(false, 'bd') if @get('backdrop-dismiss')



  #
  # register to the manager
  #
  register: ( ->
    @get('manager').registerModal(this)
  ).on('init')

  #
  # unregister before going away
  #
  unregister: ( ->
    @get('manager').unregisterModal(this)
  ).on('willDestroyElement')



  #
  # The class name that will be set when the modal gets opened
  #
  styleOpeningClasses: (->
    if @get('did-open') then "in" else ""
  ).property('did-open')

  #
  # The CSS `display` property state.
  #
  display: (->
    if @get('did-open') then 'block' else 'none'
  ).property('did-open')


  #
  # Open modal and make it visible.
  # @method open
  # @public
  #
  open: ->

    #Notify consumers that the modal is going to be opened anytime soon.
    @trigger 'show'

    #Send action to the controller during modal open time
    @sendAction 'show', this

    @set 'is-open', 'true'

    scheduleOnce 'afterRender',  =>
      @.$(document.body).addClass('modal-open')


    #Wait for component to get rendered, required for CSS effects and to notify consumers that the modal is visible now
    schedule('afterRender', this, ->
      @set 'did-open', 'true'
      @trigger 'shown'
    )

  close: (valid, value)->
    return unless @get('is-open')

    #Notify consumers that the modal will close anytime soon.
    @trigger 'hide'

    #Send action to the controller during modal close time
    @sendAction 'hide', @

    if backdrop = @get('backdrop')
      backdrop.animateOut()

    if dialog = @get('dialog')
      dialog.animateOut().then( =>
        @setProperties
          'is-open': undefined
          'did-open': undefined
        scheduleOnce 'afterRender',  =>
          b = @.$(document.body)
          b.removeClass('modal-open') if b
        @get('manager').modalClosed(this, valid, value)
      )
    else
      RSVP.resolve()


  #
  # Toggle the visibility of the modal based on its current state.
  #
  toggleVisibility: ->
    if @get('is-open') then @close() else @open()

  #
  # Set the header of the modal.
  #
  setHeader: (header) ->
    @set 'header', header

  #
  # Handle keyboard events
  #
  handleKeyboard: ((e) ->
    switch(e.keyCode)
      when 27 then @close()
  ).on('keyDown')

  #
  # activates at the toggling of the active property
  #
  activateOn: ( ->
    if @get('active')
      unless @get('is-open')
        @open()
    else
      if @get('is-open')
        @close()

  ).observes('active')

  #
  # observers the `open-if` property, if set to true, then open the modal.
  # @method openIf
  # @private
  #
  openIf: (->
    return if not @get('open-if')
    @open()
  ).observes('open-if')


  ###*
  # observers the `close-if` property, if set to true, then close the modal.
  # @method closeIf
  # @private
  ###
  closeIf: (->
    return if not @get('close-if')
    @close()
    @set 'close-if', false
  ).observes('close-if')

)

export default ModalComponent
