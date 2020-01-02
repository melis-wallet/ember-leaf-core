import Component from '@ember/component'

import AsItem from 'ember-leaf-core/mixins/leaf-as-item'

ListItem = Component.extend(AsItem,
  tagName: 'li'
  classNames: ['list-group-item']
)

export default ListItem
