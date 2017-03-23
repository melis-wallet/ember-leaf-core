`import Ember from 'ember'`


ResizeTabdrop = Ember.Mixin.create(

  setTabDrop: (->
    if @get('tabdrop')
      Ember.run.scheduleOnce 'afterRender', this, @_setTabDrop
  ).on('didInsertElement')

  _setTabDrop: ->
    @.$().tabdrop(text: '<i class="fa fa-align-justify"></i>')
)
`export default ResizeTabdrop`

