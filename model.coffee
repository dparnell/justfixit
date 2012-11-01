Projects = new Meteor.Collection("projects")
Tasks = new Meteor.Collection("tasks")

Projects.allow
        # disallow insertion of projects
        insert: (userId, project) -> false

        # only allowed to update projects you own
        update: (userId, projects, fields, modifier) ->
                _.all projects (project) -> project.owner == userId

        # projects may not be deleted
        remove: (userId, projects) -> false

Meteor.methods
        createProject: (options) ->
                # TODO: add validations

                if this.userId
                        Projects.insert
                                owner: this.userId
                                name: options.name
                                description: options.description
                                public: options.public
                                members: []
                else
                        throw new Meteor.Error 403, 'Login required'