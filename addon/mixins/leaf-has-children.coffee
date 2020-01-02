import Mixin from '@ember/object/mixin'
import { A } from '@ember/array'


HasChildren = Mixin.create(

  #
  #
  #
  children: null

  #
  # children call this to register themself on init
  #
  registerChild: (child) ->
    @get('children').pushObject(child)
    @trigger('childRegistered', child) if @has('childRegistered')

  #
  # children call this to unregister themself before being destroyed
  #
  unRegisterChild: (child) ->
    @get('children').removeObject(child)
    @trigger('childUnregistered', child) if @has('childUnregistered')

  #
  #
  #
  setup: (-> @set('children', A())).on('init')
)

export default HasChildren