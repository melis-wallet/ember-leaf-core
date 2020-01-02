import Mixin from '@ember/object/mixin'
import { scheduleOnce } from '@ember/runloop'

ResizeTabdrop = Mixin.create(

  setTabDrop: (->
    if @get('tabdrop')
      scheduleOnce 'afterRender', this, @_setTabDrop
  ).on('didInsertElement')

  _setTabDrop: ->
    @.$().tabdrop(text: '<i class="fa fa-align-justify"></i>')
)

export default ResizeTabdrop

