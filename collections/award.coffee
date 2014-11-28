@Awards = new Meteor.Collection('awards')

Awards.allow
	insert: (userId, doc) ->
		if Meteor.user()
			return doc
		else
			return false

Awards.deny
	insert: (userId, doc) ->
		#Update Awards counts
		Meteor.setTimeout ->
			Meteor.users.find().fetch().forEach (x) ->
				awardcount = Awards.find(nominees:
					$in: [x._id]).count()
				Meteor.users.update  _id : x._id,
							$set: 
								'profile.awardCount':awardcount
			, 1000
		doc.createdAt = new Date
		return false

Awards.deny
	insert: (userId, doc) ->
		console.log doc
		if doc.reason.length < 200
			console.log doc.reason.length
			Meteor.Error "KEBAB!", "KEBABAGE"
			return true
		else
			return false