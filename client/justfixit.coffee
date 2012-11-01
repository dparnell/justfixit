Meteor.subscribe 'projects'

Template.page.projects = () -> Projects.find({})

Template.page.events
        'click #add': () ->
                $('#project-name').val ''
                $('#project-description').val ''
                $('#public-project').removeAttr 'checked'
                $('#add-project').modal 'show'

                false

        'click #add-project .btn-primary': () ->
                Meteor.call 'createProject',
                        name: $('#project-name').val()
                        description: $('#project-description').val()
                        public: $('#public-project').prop 'checked',
                        (error) ->
                                if error
                                        $('#alert-reason').text(error.reason)
                                        $('#alert-details').text(error.details)
                                        $('.alert').alert().show()

                $('#add-project').modal 'hide'

                false