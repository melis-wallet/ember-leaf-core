`import Ember from 'ember'`

Leaf = {
  name: 'ember-leaf-core'

  initialize: (application) ->
    Ember.libraries.register('Leaf [core]', '0.8.0')

}

`export default Leaf`
