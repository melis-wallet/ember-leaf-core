import Component from '@ember/component'

import HasChildren from 'ember-leaf-core/mixins/leaf-has-children'
import layout from 'ember-leaf-core/templates/components/leaf-navs-content'

NavsContent = Component.extend(HasChildren,
  layout: layout

  tagName: 'section'
  classNames: ['tab-content']

  classNameBindings: ['bordered:tab-content-bordered']

  bordered: false

  'selected-idx': null

  'delay-render': true

  actions:
    select: (idx) ->
      @set('selected-idx', idx)

    close: ->
      return

  #
  # The selected tab instance.
  #
  # @property selectedTab
  # @type Tab
  # @private
  # @see Tab
  #
  #
  selected: (->
    @get('children').findBy('idx', @get('selected-idx'))
  ).property('selected-idx', 'children.[]')

)

export default NavsContent
