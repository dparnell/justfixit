Meteor.publish "projects", () ->
        if this.userId
                Projects.find
                        $or: [ { public: true }, { member: this.userId }, { owner: this.userId } ]
        else
                Projects.find
                        public: true