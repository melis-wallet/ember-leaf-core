import Mixin from '@ember/object/mixin'
import { isNone } from '@ember/utils'
import RSVP from 'rsvp'
import { debounce } from '@ember/runloop'
import $ from 'jquery'

import Logger from 'ember-leaf-core/utils/logger'


ResizeHandler = Mixin.create(

  # Time in ms to debounce before triggering resizeEnd
  resizeEndDelay: 250
  resizing: false

  _findResizableParent: (parent)->
    return(null) if isNone(parent)

    if !parent.has('resize')
      return @_findResizableParent(parent.get('parentView'))

    parent

  _setupResizeHandlers: (->
    resizeHandler = @_handleResize
    parent = @_findResizableParent(@get('parentView'))
    if isNone(parent)
      resizeHandler = $.proxy(resizeHandler, this)
      # element doesn't have any resizable parent, so bind to the window
      $(window).on('resize.' +  @elementId, resizeHandler)
      @_resizeHandler = resizeHandler
    else
      Logger.debug '++ insert on parent'
      parent.on('resize', this, resizeHandler)

  ).on('didInsertElement')


  _removeResizeHandlers: (->
    if (@_resizeHandler)
      $(window).off('resize.' +  @elementId, @_resizeHandler)
  ).on('willDestroyElement')


  _handleResize: (event, promise) ->
    if isNone(promise)
      promise = RSVP.resolve(null, "Resize handler")

    if !@get('resizing')
      @set('resizing', true)
      @trigger('resizeStart', event) if @has('resizeStart')

    @trigger('resize', event) if @has('resize')

    debounce(this, @_endResize, event, @get('resizeDelay'))

  _endResize: (event)->
    @set('resizing', false)
    @trigger('resizeEnd', event) if @has('resizeEnd')
)

export default ResizeHandler

