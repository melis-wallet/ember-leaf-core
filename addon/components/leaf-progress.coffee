import Component from '@ember/component'

import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'
import layout from 'ember-leaf-core/templates/components/leaf-progress'

ProgressComponent = Component.extend(
  layout: layout

  tagName: 'div'

  classNames: ['progress']
  classNameBindings: ['striped:progress-striped', 'animated:active', 'animated:progress-striped', 'active:active']

  classTypePrefix: 'progress'
  attributeBindings: ['style']

  value: 0

  barStyle: (->
    "width: #{@get('value')}%"
  ).property('value')

  barTypeClass: (->
    type = @get('type')
    if type
      "progress-bar-#{type}"
  ).property('type')

)

export default ProgressComponent
