Template.profileEdit.helpers
	firstName: () -> 
		return Meteor.user()["profile"]["firstName"]

	lastName: () -> 
		return Meteor.user()["profile"]["lastName"]

	fullName: () -> 
		return Meteor.user()["profile"]["fullName"]


Template.profileEdit.events
	'submit form': (e) ->
		e.preventDefault()
		profile =
			firstName: $('#inputFirstName').val()
			lastName: $('#inputLastName').val()
			fullName: $('#inputFullName').val()
			_id: Meteor.user()._id

		Meteor.call 'updateProfile', profile
		Router.go '/'

