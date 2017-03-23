`import Ember from 'ember'`
`import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'`
`import SimpleAnimations from 'ember-leaf-core/mixins/leaf-simple-animations'`
`import layout from 'ember-leaf-core/templates/components/leaf-alert'`

LeafAlertComponent = Ember.Component.extend(TypeSupport, SimpleAnimations,
  layout: layout

  classNames: ['alert'],
  classNameBindings: ['dark:alert-dark', 'closed:hidden']

  # animations states
  animated: true

  closed: false

  'animation-quick': false

  # animations
  'in-animation': 'fadeIn'
  'out-animation': 'fadeOutUp quick'

  #
  # does the alert have a dismiss button
  #
  dismiss: true

  #
  # false or number of seconds before auto-dismiss
  #
  'dismiss-after': false

  classTypePrefix: 'alert'

  alertArea: null
  alertAreaAlertId: null
  persistTimer: null


  actions:
    'dismiss-alert': ->
      @dismissAlert()

  setup: (->
    if delay = @get('dismiss-after')
      @set 'persistTimer', Ember.run.later(this, (=>
        @set 'persistTimer', null
        @dismissAlert();
      ), (delay * 1000))
  ).on('init')


  cancelTimer: (->
    if timer = @get 'persistTimer'
      Ember.run.cancel(timer)
      @set 'persistTimer', null
  ).on('willDestroyElement')


  dismissAlert: ->

    if timer = @get 'persistTimer'
      Ember.run.cancel(timer)
      @set 'persistTimer', null

    if @get('animated')
      @animateOut().then (=> @doneDismissAlert())
    else
      @doneDismissAlert()

  doneDismissAlert: ->
    if alert = @get('alertAreaAlert')
      @sendAction 'alert-dismissed', alert
    else
      @set('closed', true) unless @get('isDestroyed')
)
`export default LeafAlertComponent`
