import Mixin from '@ember/object/mixin'
import { schedule } from '@ember/runloop'
import $ from 'jquery'


StyleBody = Mixin.create(
  activate: ->
    @_super()
    cssClasses = @get('classNames')

    if cssClasses
      schedule('afterRender', null, ->
        cssClasses.forEach( (curClass) ->
          $('body').addClass(curClass)
        )
      )

  deactivate: ->
    @_super()
    cssClasses = @get('classNames')

    if cssClasses
      schedule('afterRender', null, ->
        cssClasses.forEach( (curClass) ->
          $('body').removeClass(curClass)
        )
      )
)

export default StyleBody
