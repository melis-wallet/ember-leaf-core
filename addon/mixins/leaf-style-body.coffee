`import Ember from 'ember'`

StyleBody = Ember.Mixin.create(
  activate: ->
    @_super()
    cssClasses = @get('classNames')

    if cssClasses
      Ember.run.schedule('afterRender', null, ->
        cssClasses.forEach( (curClass) ->
          Ember.$('body').addClass(curClass)
        )
      )

  deactivate: ->
    @_super()
    cssClasses = @get('classNames')

    if cssClasses
      Ember.run.schedule('afterRender', null, ->
        cssClasses.forEach( (curClass) ->
          Ember.$('body').removeClass(curClass)
        )
      )
)

`export default StyleBody`
