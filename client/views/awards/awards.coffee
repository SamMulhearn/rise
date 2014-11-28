Template.awards.helpers
	# awardsCounts: () ->
	awards: ->
		return Awards.find {}, 
			sort:
				'createdAt': -1

			
Template.awards.rendered = () ->
		
	drawChart = ->
		data = new google.visualization.DataTable()
		data.addColumn 'string', 'Nominee'
		data.addColumn 'number', 'Nominations'

		nominees = Meteor.users.find({},
		  limit: 5
		  sort:
		    "profile.awardCount": -1
		)

		nominees.map (it)->
			console.log
			data.addRow [ it.profile.fullName, it.profile.awardCount ]

		options =
	    title: "FMYG Leaderboard"
	    vAxis:
	      title: ""
	    legend: "none"
	    colors: ['purple']

	  chart = new google.visualization.BarChart(document.getElementById("chart_div"))
	  chart.draw data, options
	  return
	google.load "visualization", "1.0",
	  packages: ["corechart"]
	  callback: drawChart

	google.setOnLoadCallback drawChart
	$(window).resize ->
  	drawChart()