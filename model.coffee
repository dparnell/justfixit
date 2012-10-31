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

                Projects.insert
                        owner: this.userId
                        name: options.name
                        description: options.description
                        public: options.public
                        members: []

