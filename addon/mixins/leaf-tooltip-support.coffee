`import Ember from 'ember'`

TooltipSupport = Ember.Mixin.create(


  attributeBindings: [ 'data-toggle', 'tooltip' ]
  classNameBindings: ['tooltip-class']

  'data-toggle': null

  tooltip: null
  popover: null

  enable: (->
    if @get('popover-element-id')
      @enableHTMLPopover()
    if @get('popover')
      @enablePopOver()
    else if @get('tooltip')
      @enableToolTip()
  ).observes( 'popover', 'popover-title', 'tooltip' ).on( 'didInsertElement' )


  enableHTMLPopover: ->
    Ember.run.scheduleOnce 'afterRender', this, @_enableHTMLPopover

  _enableHTMLPopover: ->
    el = @get('popover-element-id')
    this.$().popover {
      content: ->
        $(el).html()
      template: '<div class="popover large" role="tooltip"><div class="arrow"></div><div class="popover-content no-padding"></div></div>'
      html: true
      placement:  @get('popover-placement') || @get('tooltip-placement') || 'top'
    }


  enablePopOver: ->
    Ember.run.scheduleOnce 'afterRender', this, @_enablePopOver

  _enablePopOver: ->
    popover = @get('popover')
    if('undefined' == typeof this.$().attr('data-original-title'))
      @set('data-toggle', 'popover')
      this.$().popover {
        content: popover,
        title: @get('popover-title')
        placement:  @get('popover-placement') || @get('tooltip-placement') || 'top'
      }

    else
      this.$().attr('data-original-title', @get('popover-title'))
      this.$().attr('data-content', popover)


  enableToolTip: ->
    Ember.run.scheduleOnce 'afterRender', this, @_enableToolTip

  _enableToolTip: ->
    tooltip = @get('tooltip')
    if('undefined' == typeof this.$().attr('data-original-title'))
      @set('data-toggle', 'tooltip')
      this.$().tooltip {
        title: tooltip,
        container: 'body',
        placement: @get('tooltip-placement') || 'top'
      }

    else
      this.$().attr('data-original-title', tooltip)


  removeToolTip: (->

    this.$().tooltip('destroy')
  ).on('willDestroyElement')

)


`export default TooltipSupport`
