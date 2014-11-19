Meteor.publish 'awards', ()->
	return Awards.find({})

Meteor.publish 'directory', ->
	return Meteor.users.find {},
		fields:
			email:true
			profile: true
