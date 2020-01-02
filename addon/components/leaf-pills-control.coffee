import Component from '@ember/component'
import { scheduleOnce } from '@ember/runloop'

import HasChildren from 'ember-leaf-core/mixins/leaf-has-children'
import HasSelectableChildren from 'ember-leaf-core/mixins/leaf-has-selectable-children'
import SizeSupport from 'ember-leaf-core/mixins/leaf-size-support'
import layout from 'ember-leaf-core/templates/components/leaf-pills-control'

PillsControl = Component.extend(HasChildren, HasSelectableChildren, SizeSupport,
  layout: layout

  tagName: 'ul'
  classNames: ['nav', 'nav-pills']
  classNameBindings: ['stacked:nav-stacked']

  attributeBindings: ['aria-multiselectable', 'role'],

  #
  #
  #
  justified: false

  # Tells screenreaders that only one tab can be selected at a time.
  #
  # @property aria-multiselectable
  # @type String
  # @default false
  #
  'aria-multiselectable': false

  #
  # The `role` attribute of the tab list element.
  #
  # See http://www.w3.org/TR/wai-aria/roles#tablist
  #
  # @property role
  # @type String
  # @default 'tablist'
  #
  role: 'tablist',

  #
  # Gives focus to the selected tab.
  #
  # @method focusSelectedTab
  #
  focusSelectedTab: ->
    @get('selected').$().focus()


  navigateOnKeyDown: ((event)->
    switch event.keyCode
      # left, up
      when 37, 38 then @selectPreviousChild()
      # right, down
      when 39, 40 then @selectNextChild()

    event.preventDefault()
    scheduleOnce('afterRender', this, @focusSelectedTab);
  ).on('keyDown')

)

export default PillsControl
