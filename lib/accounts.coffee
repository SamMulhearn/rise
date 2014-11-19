if Meteor.isServer
	Accounts.onLogin (user)->
		email =  user["user"]["emails"]["0"]["address"] #Get users email address
		preDomain = email.indexOf("@") #get location of @
		preDomain = email.substring(0,preDomain) #Get first part of email address
		dotLocation = preDomain.indexOf(".") #CHeck firstname.surname format
		usrId = user["user"]["_id"]
		toTitleCase = (str) ->
		  str.replace /(?:^|\s)\w/g, (match) ->
		    match.toUpperCase()
		
		if dotLocation > 0 #Check if has firstname.surname
			firstName = toTitleCase(preDomain.substring(0,dotLocation))
			lastName = toTitleCase(preDomain.substring(dotLocation+1,preDomain.length))

		if !user["user"]["profile"].hasOwnProperty('firstName') #Check if firstname is already populated
			Meteor.users.update(_id:usrId, {"$set" : {"profile.firstName": firstName}} )

		if !user["user"]["profile"].hasOwnProperty('lastName') #Check if lastname is already populated
			Meteor.users.update(_id:usrId, {"$set" : {"profile.lastName": lastName}} )

		if !user["user"]["profile"].hasOwnProperty('fullName') #Check if fullname is already populated
			Meteor.users.update(_id:usrId, {"$set" : {"profile.fullName": firstName + ' ' + lastName}} )
