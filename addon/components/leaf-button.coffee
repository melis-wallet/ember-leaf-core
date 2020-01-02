import Component from '@ember/component'
import { isBlank, isPresent, isNone } from '@ember/utils'
import RSVP from 'rsvp'

import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'
import SizeSupport from 'ember-leaf-core/mixins/leaf-size-support'
import TooltipSupport from 'ember-leaf-core/mixins/leaf-tooltip-support'
import layout from 'ember-leaf-core/templates/components/leaf-button'

ButtonComponent = Component.extend(TypeSupport, SizeSupport, TooltipSupport,
  layout: layout

  tagName: 'button'

  attributeBindings: ['disabled', 'btnstate', 'btype:type']

  classNames: ['btn']
  classTypePrefix: 'btn'
  classNameBindings: ['class', 'variantClass', 'block:btn-block', 'outline:btn-outline', 'labeled:btn-labeled', 'active:active']

  btnstate: null
  btype: null

  'action-target': null
  'show-state': null

  flat: true

  group: null

  #
  # variants, ie: rounded, flat
  #
  variantClass: ( ->
    variant = @get 'variant'
    if variant?
      pref = @get 'classTypePrefix'
      "#{pref}-#{variant}"
  ).property('variant')


  ###*
  # If set, an icon tag will be added as apart of the button and the given value here will be set
  # as the icon's `class` attribute.
  # @property icon-classes
  # @public
  ###
  iconClasses: (->
    propName = "icon-" + @get('btnstate')
    @getWithDefault(propName, @get('icon'))
  ).property('btnstate', 'icon', 'icon-executing', 'icon-resolved', 'icon-rejected')

  ###
  # The label of the button, calculated according to the state of the button
  # See the `state` property documentation for more info.
  # @property label
  # @private
  ###
  btnLabel: (->
    state = @get('btnstate')
    return @get('label') unless state
    @getWithDefault state, @get('label')
  ).property('btnstate', 'label', 'executing', 'resolved', 'rejected')


  ###*
  # Triggered when the button is clicked
  # Invoke the action name on the controller defined in the `action` property, default is `onClick`.
  # The action on the controller recieves a property that should be set to the promise being invoked (if there is one)
  # If a promise was set, the button will move to 'executing' state until the promise will be resolved
  # @method onClick
  # @private
  ###

  click: (->
    deferred = RSVP.defer()

    if target = @get('action-target')
      target.send(@get('on-click'), @get('value'))
    else
      if @get('show-state')
        deferred = RSVP.defer()
        @setProperties
          btnstate: 'executing'
          disabled: true
        deferred.promise.then( (value) =>
          @set 'btnstate', 'resolved'
        ).catch((err) =>
          @setProperties
            btnstate: 'rejected'
            error: err
        ).finally( => @set 'disabled', false)

        @sendAction 'on-click', deferred, @get('value')
      else
        @sendAction 'on-click', @get('value')
    false
  )


  setup: (->
    if group = @get('group')
      props = group.getProperties('type', 'size', 'block', 'outline', 'flat')
      for key, value of props
        @set(key, value) if isNone(@get(key))

  ).on('init')
)

export default ButtonComponent
