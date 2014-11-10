Template.award_new.events
  'submit form': (event) ->
    event.preventDefault()

    award =
      Nominee: 'test'
      Reason: event.target.details.value

    console.log award
    Meteor.call 'newAward', award
