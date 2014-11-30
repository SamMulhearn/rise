Template.errors.helpers
  errors: ->
    return Errors.find()

Template.error.events
	'click button': () ->
			Errors.remove(this)


Template.error.rendered = ->
  error = @data
  Meteor.setTimeout (->
    Errors.remove error._id
    return
  ), 9000
  return