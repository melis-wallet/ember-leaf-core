import Component from '@ember/component'

import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'
import SizeSupport from 'ember-leaf-core/mixins/leaf-size-support'
import layout from 'ember-leaf-core/templates/components/leaf-switcher'

SwitcherComponent = Component.extend(TypeSupport, SizeSupport,
  layout: layout

  checked: false
  disabled: false
  item: null

  theme: 'classic'

  classNames: ['switcher']
  classNameBindings: ['disabled', 'checked', 'themeClass']

  classTypePrefix: 'switcher'

  onLabel: null
  offLabel: null

  onIcon: 'fa fa-check'
  offIcon: 'fa fa-times'

  themeClass: (->
    if theme = @get('theme')
      "switcher-theme-#{theme}"
  ).property('theme')

  click: ->
    return if @get('disabled')
    if @get('on-toggle')
      @sendAction('on-toggle', !@get('checked'), @get('item'))
    else
      @toggle()
    false


  toggle: ->
    @toggleProperty('checked')

)

export default SwitcherComponent
