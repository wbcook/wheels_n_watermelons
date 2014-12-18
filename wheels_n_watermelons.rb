# A fundraising app that tracks the funding of various odd projects. Now with encapsulation
# and a Fundraising class to manage lists of proejects and their collections.
require_relative 'fundraiser'
require_relative 'project'

# Output goes here...
wheels = Project.new( "wheels", 250, 1000, 25 )
watermelons = Project.new( "watermelons", 500, 1250, 4)
alpacas = Project.new( "alpacas", 1975, 2000, 12 )

agriculture = Fundraiser.new("Agriculture")
agriculture.add_project(wheels)
agriculture.add_project(watermelons)
agriculture.add_project(alpacas)
agriculture.collect

# EOF
