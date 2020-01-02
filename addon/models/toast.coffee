import EmberObject from '@ember/object'

Toast = EmberObject.extend
  sticky: false
  location: 'bottom'
  status: null
  type: null
  message: null
  icon: null


export default Toast
