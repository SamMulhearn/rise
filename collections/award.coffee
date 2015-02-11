@Awards = new Meteor.Collection('awards')


Meteor.methods
	insertAward: (award)->
		if !Meteor.user
			throw new Meteor.Error 'Not Logged In', 'You must be logged in to create a new FMYG nomination'
		if award.nominees.length < 1
			throw new Meteor.Error 'No Nominees', 'You must select at least one nominee for your nomination'
		if award.reason.length < 100
			throw new Meteor.Error 'Reason not long enough', 'You must provide at least 100 characters for the reason for the nomination'

		
		award.createdAt = new Date #Add CreatedAt field to new awards

		# Meteor.setTimeout ->
		# 	Meteor.users.find().fetch().forEach (x) ->
		# 		awardcount = Awards.find(nominees:
		# 			$in: [x._id]).count()
		# 		Meteor.users.update  _id : x._id,
		# 					$set: 
		# 						'profile.awardCount':awardcount
		# 	, 1000


		Awards.insert award, (error, docId)->
			if !error
			else
				throw new Meteor.Meteor.Error 'Insert Failed', error


		