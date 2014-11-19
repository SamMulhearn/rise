
@Awards = new Meteor.Collection("awards")

# x = ->
# 	y = Meteor.users.find().fetch().map (it) ->
# 		label: it.profile.fullName
# 		value: it._id
# 	return y
# x = x()
# console.log x

Meteor.methods
	newAward: (award) ->
		if !Meteor.user()
			console.log 'User not logged in'
			throw new Meteor.error 'Not logged in'

		awardId = Award.insert
			Reason: award.Reason
			Nominee: award.Nominee
			Nominator: Meteor.userId()
			CreatedOn: new Date
			
		return awardId