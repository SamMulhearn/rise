Meteor.publish 'awards', ()->
	return Awards.find({})

Meteor.publish 'directory', ->
	return Meteor.users.find {},
		fields:
			emails:true
			profile: true