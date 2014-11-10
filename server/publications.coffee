Meteor.publish 'awards', ()->
	return Award.find({})