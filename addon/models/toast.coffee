`import Ember from 'ember'`

Toast = Ember.Object.extend
  sticky: false
  location: 'bottom'
  status: null
  type: null
  message: null
  icon: null


`export default Toast`
