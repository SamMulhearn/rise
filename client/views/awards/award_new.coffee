Template.award_new.events
    'click button': (event) ->
        event.preventDefault()
        award =
    	   nominees: $("input[type=checkbox]:checked").map(-> $(this).val()).toArray()
    	   reason: $('textarea#reason').val()
    	   nominator: Meteor.userId()
        Meteor.call 'insertAward', award, (error, result)->
            if !error
                # $('#myModal').modal('hide')
                Router.go '/awards'
            else
                throwError error.reason

    'change input[type=checkbox]': (e) ->
        searchIDs = $("input[type=checkbox]:checked").map(->
            $(this).val()).toArray()
        x = Meteor.users.find( '_id': {
            $in: searchIDs},
            fields:
                'profile.fullName': 1
            ).fetch()
        x = x.map (it) ->
            it.profile.fullName
        $('#nomineelabel').text ( x.toString().replace(/,/g,', ') )

# Template.award_new.rendered = () ->
#     $("#myModal").on "hidden.bs.modal", ->
#       Router.go "/awards"
#       return
#     $("#myModal").modal "show"