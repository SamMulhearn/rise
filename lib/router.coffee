Router.configure
	layoutTemplate: 'layout'

Router.map ->
	@route 'awards',
		path: '/awards'
		waitOn: ->
			Meteor.subscribe 'awards'
			Meteor.subscribe 'awards-counts'

	@route 'home',
		path: '/'


	@route 'award_new',
		path: '/awards/new'
		template: 'awards'
		yieldTemplates:
			'award_new':
				'to':'modal'
		waitOn: ->
			Meteor.subscribe 'awards'

	@route 'profile_edit',
		path: '/profile/edit'
		template: 'profile_edit'

	@route 'test'
