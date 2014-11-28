Meteor.methods
	updateProfile: (profile)->
		Meteor.users.update  _id : profile._id,
			$set: 
				'profile.firstName':profile.firstName
				'profile.lastName':profile.lastName
				'profile.fullName':profile.fullName
	getAwardsCounts: ()->
		x =  Meteor.users.find().fetch().map (it) ->
			fullName: it.profile.fullName
			awardsCount: Awards.find(nominees:
				$in: [it._id]).count()
		console.log x
		return x