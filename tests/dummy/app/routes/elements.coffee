import Route from '@ember/routing/route'
import EmberObject from '@ember/object'

ElementsRoute = Route.extend(
  model: () ->
    [
      EmberObject.create({title: "Typography", route: "elements.typography"})
      EmberObject.create({title: "Button", route: "elements.button"})
      EmberObject.create({title: "Dropdowns", route: "elements.dropdowns"})
      EmberObject.create({title: "Alerts", route: "elements.alerts"})
      EmberObject.create({title: "Components", route: "elements.components"})
      EmberObject.create({title: "Lists and Notes", route: "elements.lists"})
      EmberObject.create({title: "Modals", route: "elements.modals"})
      EmberObject.create({title: "Tabs", route: "elements.tabs"})
      EmberObject.create({title: "Toasts", route: "elements.toasts"})
      EmberObject.create({title: "Tooltips and Popovers", route: "elements.tooltips"})
      EmberObject.create({title: "Accordions", route: "elements.accordions"})
      EmberObject.create({title: "Panel", route: "elements.panel"})
      EmberObject.create({title: "Wizards", route: "elements.wizards"})

    ])


export default ElementsRoute
