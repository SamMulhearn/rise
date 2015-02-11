Template.awards.helpers
	# awardsCounts: () ->
	awards: ->
		return Awards.find {}, 
			sort:
				'createdAt': -1


Template.awards.rendered = ->
  # $container = $('#awardsContainer')
  # $container.imagesLoaded ->
  # $container.masonry columnWidth: 200
  # $container.masonry itemSelector: '.awardsItem'
	@autorun ->
		# x = Session.get 'x'
		y = Awards.find().fetch()
		container = $('#awardsContainer')
		container.masonry itemSelector: '.awardsItem'
		# console.log container
		container.masonry('reloadItems')
		container.masonry()
			
Template.chart.rendered = ->
	@autorun () ->
		x = Awards.find().fetch()
		console.log 'ran'
		drawChart = ->
			google.load("visualization", "1", {packages:["corechart"]});
			data = new google.visualization.DataTable()
			data.addColumn 'string', 'Nominee'
			data.addColumn 'number', 'Nominations'

			# nominees = Meteor.users.find({},
			#   limit: 5
			#   sort:
			#     "profile.awardCount": -1
			# )

			topNominees = (_.flatten(_.pluck(Awards.find().fetch(), 'nominees'))).frequencies().slice(0,5)
			topNominees.map (it)->
				data.addRow [ Meteor.users.findOne({'_id':it[0]}).profile.fullName, it[1] ]

			options =
		    title: "FMYG Leaderboard"
		    vAxis:
		      title: ""
		    legend: "none"
		    colors: ['purple']
		   	backgroundColor: { fill:'transparent' }

		  chart = new google.visualization.BarChart(document.getElementById("chart_div"))
		  chart.draw data, options
		  return
		google.load "visualization", "1.0",
		  packages: ["corechart"]
		  callback: drawChart

		google.setOnLoadCallback drawChart
		$(window).resize ->
			drawChart()


