import Component from '@ember/component'
import { later, cancel } from '@ember/runloop'

import SimpleAnimations from 'ember-leaf-core/mixins/leaf-simple-animations'
import layout from 'ember-leaf-core/templates/components/leaf-toast'

ToastComponent = Component.extend(SimpleAnimations,
  layout: layout

  'in-animation': 'fadeInLeft'
  'out-animation': 'fadeOutLeft quick'

  persistTime: 5000

  animated: true

  icon: (->
    message = @get('message')
    return message.icon if message.icon
    switch message.type
      when 'info' then 'fa fa-info-circle'
      when 'success' then 'fa fa-check-circle-o'
      when 'warn' then 'fa fa-exclamation-triangle'
      when 'error' then 'fa fa-bomb'
      else 'glyphicon fa-fa-sign'
  ).property('message')

  typeClass: (->
    classes = ''
    message = @get('message')

    type = message.type
    classes += 'toast-' + type

    return classes
  ).property('message')


  setPassiveClose: (->
    message = @get('message')

    if (message.status == 'passive' && !message.sticky)
      @set 'persistTimer', later(this, (->
        @set('persistTimer', null)
        @closeToast();
      ), @get('persistTime') )
  ).on('willInsertElement')

  beforeDestroy: (->
    if timer = @get('persistTimer')
      cancel(timer)
      @set('persistTimer', null)
  ).on('willDestroyElement')

  closeToast: ->
    @animateOut().then( =>
      @toasts.closeToast(@get('message'))
    )

  actions:
    closeToast: ->
      @closeToast()
)

export default ToastComponent
