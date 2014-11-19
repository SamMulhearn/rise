Meteor.methods
	updateProfile: (profile)->
		Meteor.users.update  _id : profile._id,
			$set: 
				'profile.firstName':profile.firstName
				'profile.lastName':profile.lastName
				'profile.fullName':profile.fullName
