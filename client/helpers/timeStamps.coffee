Template.registerHelper 'timeAgo',
	(date)->
		# moment(date).format('MMMM DD, YYYY');
		return moment(date).fromNow();