`import Ember from 'ember'`

ComponentsController = Ember.Controller.extend(
  ccTypes: ['default', 'primary', 'info', 'success', 'warning', 'danger']
  sizes: ['lg', 'sm', 'xs']
  themes: ['square', 'modern']
)
`export default ComponentsController`
