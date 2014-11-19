Template.award_new.events
  'click button': (event) ->
    event.preventDefault()
    console.log 'fired'
    # award =
    #   Nominee: 'test'
    #   Reason: event.target.details.value

    # Meteor.call 'newAward', award
    Router.go '/awards'



Template.award_new.events
	'change input[type=checkbox]': (e) ->
		searchIDs = $("input[type=checkbox]:checked").map(->
			$(this).val()).toArray()
		console.log searchIDs		
		x =  Meteor.users.find( '_id': {
			$in: searchIDs},
			fields:
				'profile.fullName': 1
		).fetch()
		console.log x
		x = x.map (it) ->
			it.profile.fullName
		$('#nomineelabel').text ( x.toString().replace(/,/g,', ') )



Template.name.rendered = ->
  $("#form").parsley trigger: "change"
  return

Template.award_new.helpers
  userList: () ->
    Meteor.users.find().fetch().map (it) ->
      label: it.profile.fullName
      value: it._id


# Meteor.registerHelper userList, ->
# 	x = Meteor.users.find().fetch().map (it) ->
# 			label: it.profile.fullName
# 	  	value: it._id
# 	return x()