`import Ember from 'ember'`

ElementsRoute = Ember.Route.extend(
  model: () ->
    [
      Ember.Object.create({title: "Typography", route: "elements.typography"})
      Ember.Object.create({title: "Button", route: "elements.button"})
      Ember.Object.create({title: "Dropdowns", route: "elements.dropdowns"})
      Ember.Object.create({title: "Alerts", route: "elements.alerts"})
      Ember.Object.create({title: "Components", route: "elements.components"})
      Ember.Object.create({title: "Lists and Notes", route: "elements.lists"})
      Ember.Object.create({title: "Modals", route: "elements.modals"})
      Ember.Object.create({title: "Tabs", route: "elements.tabs"})
      Ember.Object.create({title: "Toasts", route: "elements.toasts"})
      Ember.Object.create({title: "Tooltips and Popovers", route: "elements.tooltips"})
      Ember.Object.create({title: "Accordions", route: "elements.accordions"})
      Ember.Object.create({title: "Panel", route: "elements.panel"})
      Ember.Object.create({title: "Wizards", route: "elements.wizards"})

    ])


`export default ElementsRoute`
