import Component from '@ember/component'
import { filter } from '@ember/object/computed'

import layout from 'ember-leaf-core/templates/components/leaf-toasts'


ToastsComponent = Component.extend(
  layout: layout

  tagName: 'aside'
  classNames: 'toasts'
  classNameBindings: ['location']

  messages: filter('toasts.visibleToasts', (toast) ->
    # If this instance of the notifications component has no location affinity
    # then it gets all notifications

    if !@get('location')
      return true

    displayLocation =
      if (typeof(toast.toJSON) == 'function')
        toast.get('location')
      else
        toast.location
    @get('location') == displayLocation
  )

  messageCountObserver: (->
    @sendAction('notify', @get('messages').length)
  ).observes('messages.[]')
)

export default ToastsComponent
