Meteor.publish 'awards', ()->
	return Awards.find({})

Meteor.publish 'directory', ->
	return Meteor.users.find {},
		fields:
			emails:true
			profile: true

Meteor.publish 'awards-counts', ->
	return Awards.find({})
	# Meteor.users.find().fetch().map (it)->
	# 	'fullName': it.profile.fullName
	# 	'awardsCount': Awards.find(
	# 		nominees:
	# 			$in: [it._id]).count()