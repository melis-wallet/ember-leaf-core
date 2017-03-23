`import Ember from 'ember'`
`import layout from 'ember-leaf-core/templates/components/leaf-dropdown-option'`

LeafDropdownOptionComponent = Ember.Component.extend(
  layout: layout

  value: null

  tagName: 'li'
  classNameBindings: [ 'optionType' ]
  ariaRole: 'menuitem'

  actions:
    click: ->
      @sendAction('action', @get('value'))



  optionType: (->
    switch @get('type')
      when 'divider'
        'divider'
      when 'header'
        'dropdown-header'
  ).property('type')

)

`export default LeafDropdownOptionComponent`
