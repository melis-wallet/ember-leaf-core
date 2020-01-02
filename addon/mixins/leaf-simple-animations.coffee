import Mixin from '@ember/object/mixin'
import { scheduleOnce, later, cancel } from '@ember/runloop'
import RSVP from 'rsvp'

SimpleAnimations = Mixin.create(

  classNameBindings: ['animated', 'animation-quick:quick', 'modeAnimClass']

  animated: true
  'animation-quick': false

  'in-animation': 'fadeIn'
  'out-animation': 'fadeOut'

  saAnimGuard: 1500

  #saState: null

  modeAnimClass: (->
    switch @get('saState')
      when 'in' then @get('in-animation')
      when 'out' then @get('out-animation')
  ).property('saState')

  waitAnimationEnd: ( ->
    deferred = RSVP.defer()
    scheduleOnce('afterRender', this, @_scheduleAnimation, deferred)

    return deferred.promise
  )

  _scheduleAnimation: (deferred)->
    timer = null
    @.$().one('animationend webkitAnimationEnd oanimationend MSAnimationEnd', ->
      cancel(timer) if timer
      deferred.resolve('animation')
    )
    timer = later(this, (->
        deferred.resolve('timeout')
      ), @get('saAnimGuard')
    )


  animateIn: (->
    @set('saState', 'in')
    @waitAnimationEnd().then( =>
      if !@get('isDestroyed')
        @set('saState', null)
        @trigger('animateInDone') if @has('animateInDone')
    )
  ).on('init')

  animateOut: ->
    @set('saState', 'out')
    @waitAnimationEnd().then( =>
      if !@get('isDestroyed')
        @set('saState', null)
        @trigger('animateOutDone') if @has('animateOutDone')
    )


  animateOutRemove: ->
    if @get('animated')
      @animateOut().then( =>
        @remove()
      )
    else
      @remove()

)
`export default SimpleAnimations`
