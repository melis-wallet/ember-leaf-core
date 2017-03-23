`import Ember from 'ember'`
`import TooltipSupport from 'ember-leaf-core/mixins/leaf-tooltip-support'`
`import layout from 'ember-leaf-core/templates/components/leaf-dropdown-button'`

LeafDropdownButtonComponent = Ember.Component.extend(TooltipSupport,
  layout: layout

  classNames: [ 'btn-group', 'dropdown' ]

  align: 'left'
  iconClass: 'caret'

  actions:
    pairedButtonClick: ->
      @sendAction('on-paired-button')


  setup: (->
    Ember.run.scheduleOnce 'afterRender', =>
      @.$('.dropdown-toggle').dropdown()
  ).on('didInsertElement')
)

`export default LeafDropdownButtonComponent`
