`import Ember from 'ember'`


HasSelectableChildren = Ember.Mixin.create(


  #
  # The selected child identifier
  #
  # @property 'selected-ids'
  # @type String
  #
  'selected-idx': null

  #
  # The the selected child instance
  #
  # @property 'selected'
  # @type Object
  #
  selected: null

  #
  #
  #
  onRegister: ( (child)->
    # select the first
    unless @get('selected')
      @set('selected', child)
      @set('selected-idx', child.get('idx'))
  ).on('childRegistered')

  #
  #
  #
  onUnregister: ( (child)->
    if child.get('isSelected')
      @selectPreviousChild(child)
  ).on('childUnregistered')


  #
  #
  #
  selectPreviousChild: (child) ->
    child = @get('selected') unless child
    childpos = @get('children').indexOf child
    nextpos = (childpos == 0) ? childpos : childpos - 1
    if obj = @get('children').objectAt(nextpos)
      @select(obj)

  #
  #
  #
  selectNextChild: (child) ->
    child = @get('selected') unless child
    childpos = @get('children').indexOf child
    nextpos = (childpos == 0) ? childpos : childpos + 1
    if obj = @get('children').objectAt(nextpos)
      @select(obj)

  #
  # Select the given child.
  #
  # @method select
  # @param {Object} a tab instance to select.
  # @see selected
  # @see selected-idx
  #
  selectChild: (child) ->
    #TODO: Why we initially having an undefined tab?
    # return if not tab
    @set 'selected', child
    @set 'selected-idx', child.get 'idx'


  #
  # get one child by idx then select it
  #
  selectByIdx: (idx) ->
    child = @get('children').findBy('idx', idx)
    selectChild(child) if child

  #
  #
  #
  idxChanged: (->
    if current = @get('children').findBy('idx', @get('selected-idx'))
      @selectChild(current)
  ).observes('selected-idx', 'children.[]')
)

`export default HasSelectableChildren`