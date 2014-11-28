Template.registerHelper 'userList',
  ->
    Meteor.users.find().fetch().map (it) ->
      label: it.profile.fullName
      value: it._id
      email: it.emails[0].address

Template.registerHelper 'userName',
	(_id)->
		return Meteor.users.findOne({'_id':_id}).profile.fullName