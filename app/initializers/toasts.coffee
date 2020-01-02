
ToastsInitializer = {
  name: 'toasts'

  initialize: (application) ->

    application.inject('controller', 'toasts', 'service:leaf-toasts')
    application.inject('component', 'toasts', 'service:leaf-toasts')
    application.inject('router', 'toasts', 'service:leaf-toasts')
    application.inject('route', 'toasts', 'service:leaf-toasts')

}

export default ToastsInitializer
