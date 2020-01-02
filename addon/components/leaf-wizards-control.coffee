import Component from '@ember/component'
import { alias } from '@ember/object/computed'
import { A } from '@ember/array'
import { scheduleOnce, later } from '@ember/runloop'

import HasChildren from 'ember-leaf-core/mixins/leaf-has-children'
import HasSelectableChildren from 'ember-leaf-core/mixins/leaf-has-selectable-children'
import ResizeHandler from 'ember-leaf-core/mixins/leaf-resize-handler'
import layout from 'ember-leaf-core/templates/components/leaf-wizards-control'

WizardsControl = Component.extend(HasChildren, HasSelectableChildren, ResizeHandler,
  layout: layout

  tagName: 'div'
  classNames: ['wizard-wrapper']
  classNameBindings: ['freeze']

  'min-step-width': 200

  freeze: false

  'step-back': false

  'completed-steps': null
  steps: alias('instances.length')

  initializeCompleted: ( ->
    @set('completed-steps', A()) if !@get('completed-steps')
  ).on('init')

  resizeStepItems: ( ->
    scheduleOnce 'afterRender', this, @_resizeSteps
  ).observes('steps', 'min-steps-width').on('didInsertElement')


  _resizeSteps: ->
    #
    # resize items
    # (the delay depends on the fact that the very first step of 'fadeIn' animations, ie:
    #  when we are in a modal, has :visible false)
    # Yes it is ugly, find a better way FIXME
    later(this, (->
      if @.$() && @.$().is(":visible")
        if @.$().width() > (@get('min-step-width') * @get('steps'))
          width = Math.floor(@.$().width() / @get('steps'))
        else
          width = @get('min-step-width')
        @.$('.wizard-steps > li').each -> $(@).css({width: width})
      ), 10)

  positionStepItems: (->

    if @get('selected')
      scheduleOnce 'afterRender', this, @_positionSteps
  ).observes('selected')

  _positionSteps: ->

    if cur = @get('selected')
      item_position = cur.$().position()
      item_width    = cur.$().outerWidth()
      element_width = @.$().outerWidth()
      steps_width   = @.$('.wizard-steps').outerWidth()
      d = (element_width - item_width) / 2

      offset = 0
      if element_width < steps_width && item_position.left > d
        offset = -1 * item_position.left + d
        offset = -1 * steps_width + element_width if (steps_width + offset) < element_width
      @.$('.wizard-steps').css({ left: offset })

  resized: (->
    @resizeStepItems()
    @positionStepItems()
  ).on('resizeEnd')

  stepTo: (step) ->
    if @get('step-back')
      @selectChild(step)

)

export default WizardsControl
