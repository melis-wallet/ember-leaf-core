import Mixin from '@ember/object/mixin'
import { isBlank } from '@ember/utils'


HasSelectableChildren = Mixin.create(


  #
  # The selected child identifier
  #
  # @property 'selected-idx'
  # @type String
  #
  'selected-idx': null



  #
  #
  #
  'allow-unselect': false

  #
  #
  #
  selected: ( ->
    if (idx = @get('selected-idx'))
      @get('children').findBy('idx', idx)

  ).property('selected-idx', 'children.[]')



  #
  #
  #
  isSelected: (child) ->
    (@get('selected') == child)

  #
  #
  #
  onRegister: ((child)->
    if (isBlank(@get('selected-idx')) && !@get('allow-unselect') && (f = @get('children.firstObject')))
      @selectChild(f)
  ).on('childRegistered')

  #
  #
  #
  onUnregister: ( (child)->
    if @isSelected(child)
      if @get('allow-unselect')
        @unselect()
      else
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
      @selectChild(obj)

  #
  #
  #
  selectNextChild: (child) ->
    child = @get('selected') unless child
    childpos = @get('children').indexOf child
    nextpos = (childpos == 0) ? childpos : childpos + 1
    if obj = @get('children').objectAt(nextpos)
      @selectChild(obj)

  #
  # Select the given child.
  #
  # @method select
  # @param {Object} a tab instance to select.
  # @see selected
  # @see selected-idx
  #
  selectChild: (child) ->
    @set('selected-idx', i) if (i = child.get('idx'))

  #
  #
  #
  unselect: ->
    return unless @get('allow-unselect')
    @set('selected-idx', null)


  #
  # get one child by idx then select it
  #
  selectByIdx: (idx) ->
    if (child = @get('children').findBy('idx', idx))
      @selectChild(child)
    else
      false

  #
  #
  #
  #idxChanged: (->
  #  if current = @get('children').findBy('idx', @get('selected-idx'))
  #    @selectChild(current)
  #).observes('selected-idx', 'children.[]')
)

export default HasSelectableChildren