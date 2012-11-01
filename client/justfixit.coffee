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
                Meteor.call 'createProject'
                        name: $('#project-name').val()
                        description: $('#project-description').val()
                        public: $('#public-project').prop 'checked'

                $('#add-project').modal 'hide'