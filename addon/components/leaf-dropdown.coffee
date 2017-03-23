`import Ember from 'ember'`
`import StyleBindings from 'ember-leaf-core/mixins/leaf-style-bindings'`
`import layout from 'ember-leaf-core/templates/components/leaf-dropdown'`

LeafDropdownComponent = Ember.Component.extend(#StyleBindings,
  layout: layout

  tagName: 'ul'

  classNames: ['dropdown-menu']
  classNameBindings: 'rightAligned:dropdown-menu-right'

  align: 'left'

  actions:
    click: (action) ->
      @triggerAction(action: action)


  rightAligned: (->
    @get('align') == 'right'
  ).property('align')

)

`export default LeafDropdownComponent`
