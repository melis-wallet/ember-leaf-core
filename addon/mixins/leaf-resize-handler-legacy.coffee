import Mixin from '@ember/object/mixin'
import { bind, debounce } from '@ember/runloop'
import { computed } from '@ember/object'
import { guidFor } from '@ember/object/internals'


ResizeHandler = Mixin.create(

  # Time in ms to debounce before triggering resizeEnd
  resizeEndDelay: 500
  resizing: false

  ## FIXME remove these
  onResizeStart:  Ember.K
  onResizeEnd:    Ember.K
  onResize:       Ember.K

  # A resize handler that binds handleWindowResize to this view
  resizeHandler: computed ->
    jQuery.proxy(@handleWindowResize, @)


  debounceEnd: ->
    return if @isDestroyed
    @set('resizing', false)
    @onResizeEnd?(event)

  handleWindowResize: ((event) ->
    unless @get('resizing')
      @set('resizing', true)
      @onResizeStart?(event)
    @onResize?(event)
    debounce(this, @debounceEnd, @resizeEndDelay)
  )

  addResizeHandler: (->
    $(window).on('resize.' + guidFor(@), bind(this, @get('resizeHandler')))
#    $(window).off 'resize.' + guidFor(@), @get("resizeHandler")
  ).on('didInsertElement')

  removeResizeHandler: (->
    $(window).off('resize.' + guidFor(@), bind(this, @get('resizeHandler')))
#    $(window).off 'resize.' + guidFor(@), @get("resizeHandler")
  ).on('willDestroyElement')
)

export default ResizeHandler

