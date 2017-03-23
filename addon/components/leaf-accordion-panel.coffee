`import Ember from 'ember'`
`import LeafPanel from 'ember-leaf-core/components/leaf-panel'`
`import HasParent from 'ember-leaf-core/mixins/leaf-has-parent'`
`import layout from 'ember-leaf-core/templates/components/leaf-accordion-panel'`

LeafAccordionPanelComponent = LeafPanel.extend(HasParent,
  layout: layout

  classNameBindings: ['selected:selected_class']
  attributeBindings: ['active']

  body: true

  content: Ember.computed.alias 'accordion.content'

  #
  #
  #
  mandatoryParent: true

  #
  # true if this nav is active/selected
  #
  active: Ember.computed.alias('selected')

  #
  #
  #
  accordionBodyClass: (->
    if @get('selected') then "panel-collapse" else "collapse"
  ).property('selected')

  #
  #
  #
  accordionToggleClass: (->
    if @get('selected') then '' else 'collapsed'
  ).property('selected')

  #
  # Select this item.
  #
  # Bound to `click` event.
  #
  # @method select
  #
  selectOnClick: (->
    @select()
  ).on('click', 'touchEnd')

  #
  # Listen to `active` property changes and show / hide the item's content according to its state
  #
  # We use observes instead of properties as we need to invoke a method instead of calculating classes only
  # so in the future we can support a transition animation.
  #
  activeDidChange: (->
    if @get('active')
      @show()
    else
      @hide()
  ).observes('active')

  hide: ->
    Ember.run.scheduleOnce 'afterRender', this, @_hide

  _hide: ->
    @$('.panel-collapse').removeClass('in')


  show: ->
    Ember.run.scheduleOnce 'afterRender', this, @_show

  _show: ->
    @$('.panel-collapse').addClass('in')

  actions:
    selectPanel: ->
      @select()
)

`export default LeafAccordionPanelComponent`
