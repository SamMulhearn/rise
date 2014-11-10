@Award = new Meteor.Collection("awards")

Meteor.methods
	newAward: (award) ->
		if !Meteor.userId()
			throw Meteor.error 'Not logged in'

		console.log award
		
		awardId = Award.insert
			Reason: award.Reason
			Nominee: award.Nominee
			Nominator: Meteor.userId()
			CreatedOn: new Date


		console.log awardId 
		
		return awardId