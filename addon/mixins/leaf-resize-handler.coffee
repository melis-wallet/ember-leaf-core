`import Ember from 'ember'`


ResizeHandler = Ember.Mixin.create(

  # Time in ms to debounce before triggering resizeEnd
  resizeEndDelay: 250
  resizing: false

  _findResizableParent: (parent)->
    return(null) if Ember.isNone(parent)

    if !parent.has('resize')
      return @_findResizableParent(parent.get('parentView'))

    parent

  _setupResizeHandlers: (->
    resizeHandler = @_handleResize
    parent = @_findResizableParent(@get('parentView'))
    if Ember.isNone(parent)
      resizeHandler = Ember.$.proxy(resizeHandler, this)
      # element doesn't have any resizable parent, so bind to the window
      Ember.$(window).on('resize.' +  @elementId, resizeHandler)
      @_resizeHandler = resizeHandler
    else
      Ember.debug '++ insert on parent'
      parent.on('resize', this, resizeHandler)

  ).on('didInsertElement')


  _removeResizeHandlers: (->
    if (@_resizeHandler)
      Ember.$(window).off('resize.' +  @elementId, @_resizeHandler)
  ).on('willDestroyElement')


  _handleResize: (event, promise) ->
    if Ember.isNone(promise)
      promise = Ember.RSVP.resolve(null, "Resize handler")

    if !@get('resizing')
      @set('resizing', true)
      @trigger('resizeStart', event) if @has('resizeStart')

    @trigger('resize', event) if @has('resize')

    Ember.run.debounce(this, @_endResize, event, @get('resizeDelay'))

  _endResize: (event)->
    @set('resizing', false)
    @trigger('resizeEnd', event) if @has('resizeEnd')
)

`export default ResizeHandler`

