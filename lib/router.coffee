Router.configure
	layoutTemplate: 'layout'

Router.map  ->
	@route 'home',
		path: "/"

	@route 'award',
		path: "/award",
    # waitOn: ->
    #   Meteor.subscribe 'awards'

	@route "award_new",
    path: "/award/nominate"
    # action: -> @render 'rfcNew', {to: 'modal'}
    yieldTemplates:
      'award_new':
        to: 'modal'
    template: 'award'
    waitOn: ->
      Meteor.subscribe 'awards'

  @route "profile_edit",
  	path: "/profile/edit"