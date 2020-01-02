import EmberRouter from '@ember/routing/router'
import config from './config/environment'

Router = EmberRouter.extend(
  location: config.locationType
)

Router.map ->
  @route 'elements', ->
    @route 'accordions'
    @route 'alerts'
    @route 'button'
    @route 'dropdowns'
    @route 'components'
    @route 'lists'
    @route 'modals'
    @route 'panel'
    @route 'tabs'
    @route 'toasts'
    @route 'tooltips'
    @route 'typography'
    @route 'wizards'

`export default Router`
