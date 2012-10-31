Meteor.subscribe 'projects'

Template.projects.projects = () -> Projects.find({})
