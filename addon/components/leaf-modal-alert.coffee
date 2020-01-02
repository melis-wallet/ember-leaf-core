import ModalComponent from 'ember-leaf-core/components/leaf-modal'
import TypeSupport from 'ember-leaf-core/mixins/leaf-type-support'
import layout from 'ember-leaf-core/templates/components/leaf-modal-alert'

ModalAlert = ModalComponent.extend(TypeSupport,
  layout: layout


  classNames: ['modal-alert']
  classTypePrefix: 'modal'

  type: 'info'
  icon: null

  title: null
  caption: null

  okLabel: 'Ok'
  cancelLabel: null

  okIcon: 'fa fa-check'
  cancelIcon: 'fa fa-times'

  hasCancel: true

  iconClass: (->
    return icon if (icon = @get('icon'))

    switch @get('type')
      when 'info' then 'fa fa-info-circle'
      when 'success' then 'fa fa-check-circle'
      when 'warning' then 'fa fa-warning'
      when 'danger' then 'fa fa-times-circle'
      else 'fa fa-sign'
  ).property('type')

)

export default ModalAlert
