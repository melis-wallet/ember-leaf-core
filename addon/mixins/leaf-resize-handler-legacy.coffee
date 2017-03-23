`import Ember from 'ember'`


ResizeHandler = Ember.Mixin.create(

  # Time in ms to debounce before triggering resizeEnd
  resizeEndDelay: 500
  resizing: false

  onResizeStart:  Ember.K
  onResizeEnd:    Ember.K
  onResize:       Ember.K

  # A resize handler that binds handleWindowResize to this view
  resizeHandler: Ember.computed ->
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
    Ember.run.debounce(this, @debounceEnd, @resizeEndDelay)
  )

  addResizeHandler: (->
    $(window).on('resize.' + Ember.guidFor(@), Ember.run.bind(this, @get('resizeHandler')))
#    $(window).off 'resize.' + Ember.guidFor(@), @get("resizeHandler")
  ).on('didInsertElement')

  removeResizeHandler: (->
    $(window).off('resize.' + Ember.guidFor(@), Ember.run.bind(this, @get('resizeHandler')))
#    $(window).off 'resize.' + Ember.guidFor(@), @get("resizeHandler")
  ).on('willDestroyElement')
)

`export default ResizeHandler`

