import Mixin from "@ember/object/mixin"
import { scheduleOnce } from "@ember/runloop"
import { computed } from '@ember/object'
import { alias } from "@ember/object/computed"

TooltipSupport = Mixin.create(

  attributeBindings: [ 'data-balloon', 'data-balloon-pos', 'data-balloon-length', 'data-balloon-visible' ]

  'tooltip-placement': 'top'

  tooltip: alias('data-balloon')
  'tooltip-length': alias('data-balloon-length')
  'tooltip-visible': alias('data-balloon-visible')

  'data-balloon-pos': computed('tooltip-placement', ->

    switch @get('tooltip-placement')
      when 'top' then 'up'
      when 'bottom' then 'down'
      else @get('tooltip-placement')
  )

)


export default TooltipSupport
