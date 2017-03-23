`import Ember from 'ember'`


HasParent = Ember.Mixin.create(

  #
  #
  #
  mandatoryParent: false

  #
  #
  #
  parent: null

  #
  #
  #
  selectable: true


  #
  #
  #
  siblings: Ember.computed.alias('parent.children')


  #
  # true if this child is currently selected.
  #
  # @property selected
  # @type Boolean
  #
  selected: (->
    @get('parent.selected') == this
  ).property('parent.selected')

  #
  # The index of this tab in the `ivy-tab-list` component.
  #
  # @property index
  # @type Number
  #
  indexAsChild: (->
    if siblings = @get('siblings')
      siblings.indexOf(this)
  ).property('siblings.[]')


  #
  #
  #
  select: ->
    if @get('selectable')
      @get('parent').selectChild(this)


  #
  #
  #
  setup: (->
    Ember.run.once(this, @_registerWithParent)
  ).on('init')


  #
  #
  #
  teardown: (->
    Ember.run.once(this, @_unregisterWithParent)
  ).on('willDestroyElement')


  _registerWithParent: ->
    if parent = @get('parent')
      parent.registerChild(this)
    else if @mandatoryParent
      Ember.Logger.error "Missing mandatory parent. This subcomponent needs one."

    if !@get('idx') && @mandatoryParent
      Ember.Logger.debug('Children need an unique identifier idx, getting the elementId.')
      @set('idx', @get('elementId'))


  _unregisterWithParent: ->
    if parent = @get('parent')
      parent.unRegisterChild(this)

)

`export default HasParent`