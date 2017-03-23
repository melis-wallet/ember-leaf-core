`import Ember from 'ember'`

Toasts = Ember.Service.extend(

  delayedToasts: Ember.A()
  toasts: Ember.A()

  visibleToasts: Ember.computed.alias('toasts')

  queueToast: (message) ->

    message.location ||= 'bottom'
    message.status   ||= 'passive'

    Ember.Logger.debug "+ Toast: ", message

    if Ember.get(message, 'delayed')
      @delayedToasts.pushObject(message)
    else
      @toasts.pushObject(message)


  showInfo: (message, options) ->
    options = options || {}

    if options.closePassive
      @closePassive()


    options.status ||= 'persistent'

    options.type = 'info'
    options.message = message

    @queueToast(options)

  showSuccess: (message, options) ->
    options = options || {}

    if options.closePassive
      @closePassive()

    options.type = 'success'
    options.message = message

    @queueToast(options)

  showWarn: (message, options) ->
    options = options || {}

    if options.closePassive
      @closePassive()

    options.status ||= 'persistent'

    options.type = 'warn'
    options.message = message

    @queueToast(options)


  showError: (message, options) ->
    options = options || {}

    if options.closePassive
      @closePassive()

    options.status ||= 'persistent'

    options.type = 'error'
    options.message = message

    @queueToast(options)


  showErrors: (errors, options) ->
    options = options || {}

    if options.closePassive
      @closePassive()

    for error in errors
      @showError(error.message || error, { closePassive: false })

  showAPIError: (resp, options) ->
    options = options || {}

    if options.closePassive
      @closePassive()

    options.defaultErrorText = options.defaultErrorText ||
            'There was a problem on the server, please try again.';


    if (resp &&  resp.responseJSON && resp.responseJSON.error)
      @showError(resp.responseJSON.error, options)
    else if (resp && resp.responseJSON && resp.responseJSON.errors)
      @showErrors(resp.responseJSON.errors, options)
    else if (resp && resp.responseJSON && resp.responseJSON.message)
      @showError(resp.responseJSON.message, options)
    else if (resp && resp.responseJSON && resp.responseJSON.short_msg)
      @showError(resp.responseJSON.short_msg, options)
    else
      @showError(options.defaultErrorText, { closePassive: false })


  displayDelayed: ->
    @get('delayedToasts').forEach((message) =>
      @queueToast(message))
    @set('delayedToasts', Ember.A())


  closeToast: (toast) ->
    @get('toasts').removeObject(toast)

  closePassive: ->
    @set('toasts', @rejectBy('status', 'passive'))

  closePersistent: ->
    @set('toasts', @rejectBy('status', 'persistent'))

  closeAll: ->
    @get('toasts').clear()

)

`export default Toasts`