if Meteor.isClient
  Template.navItems.helpers activeIfTemplateIs: (template) ->
    currentRoute = Router.current()
    (if currentRoute and template is currentRoute.lookupTemplate() then class: "active" else "")