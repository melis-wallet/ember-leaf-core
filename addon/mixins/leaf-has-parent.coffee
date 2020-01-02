import Mixin from '@ember/object/mixin'
import { alias } from '@ember/object/computed'
import { once } from '@ember/runloop'

import Logger from 'ember-leaf-core/utils/logger'


HasParent = Mixin.create(

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
  siblings: alias('parent.children')


  #
  # true if this child is currently selected.
  #
  # @property selected
  # @type Boolean
  #
  selected: (->
    @get('parent')?.isSelected(this)
  ).property('parent.selected')

  #
  # The index of this tab in the `tab-list` component.
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
    @get('parent')?.selectChild(this) if @get('selectable')


  #
  #
  #
  unselect:  ->
    @get('parent')?.unselect()


  #
  #
  #
  toggleSelect: ->
    if @get('selected')
      @unselect()
    else
      @select()

  #
  #
  #
  setup: (->
    once(this, @_registerWithParent)
  ).on('init')


  #
  #
  #
  teardown: (->
    once(this, @_unregisterWithParent)
  ).on('willDestroyElement')


  _registerWithParent: ->
    if parent = @get('parent')

      if !@get('idx')
        Logger.debug('Children need an unique identifier idx, getting the elementId.')
        @set('idx', @get('elementId'))

      parent.registerChild(this)


    else if @mandatoryParent
      Logger.error "Missing mandatory parent. This subcomponent needs one."



  _unregisterWithParent: ->
    if parent = @get('parent')
      parent.unRegisterChild(this)

)

export default HasParent