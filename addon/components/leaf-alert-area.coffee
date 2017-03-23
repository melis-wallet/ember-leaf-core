`import Ember from 'ember'`
`import layout from 'ember-leaf-core/templates/components/leaf-alert-area'`

LeafAlertAreaComponent = Ember.Component.extend(
  layout: layout

  alerts: []

  'dismiss-after': 0
  'max-alerts': 5

  dark: false
  embedded: false

  displayedAlerts: ( ->
    @get('alerts').slice(-@get('max-alerts'), 100)
  ).property('alerts.[]')

  topAlert: (->
    @get('alerts.firstObject')
  ).property('alerts.[]')

  singleAlert: (->
    @get('embedded') || @get('max-alerts') == 1
  ).property('max-alerts')


  actions:
    closedAlert: (alert) ->
      @get('alerts').removeObject alert


)

`export default LeafAlertAreaComponent`
