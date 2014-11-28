Template.award_new.events
    'click button': (event) ->
        event.preventDefault()
        award =
    	   nominees: $("input[type=checkbox]:checked").map(-> $(this).val()).toArray()
    	   reason: $('textarea#reason').val()
    	   nominator: Meteor.userId()
        Awards.insert award
        $('#myModal').modal('hide')        
        # Awards.insert award, (error, id)->
        #     if error
        #         console.log error
        #     else
        #         $('#myModal').modal('hide')

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


Template.award_new.rendered = () ->
    $('#form').parsley()