# A fundraising app that tracks the funding of various odd projects. Now with encapsulation
# and a Fundraising class to manage lists of proejects and their collections.
require_relative 'fundraiser'
require_relative 'project'

# Output goes here...
wheels = Project.new( "wheels", 150, 200, 25 )
watermelons = Project.new( "watermelons", 0, 300, 4)
alpacas = Project.new( "alpacas", 175, 200, 12 )

agriculture = Fundraiser.new("Agriculture")
agriculture.add_project(wheels)
agriculture.add_project(watermelons)
agriculture.add_project(alpacas)
agriculture.collect

# EOF
