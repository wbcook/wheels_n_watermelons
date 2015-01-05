# A fundraising app that tracks the funding of various odd projects. Now with encapsulation
# and a Fundraising class to manage lists of proejects and their collections.
require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

class Fundraiser
  def initialize(title)
    @title = title
    @projects = []
  end
  def add_project(project)
    @projects.push(project)
  end
  def collect
    puts @projects
    @projects.each do |project|
      FundingRound.funding_round(project)
      project.expirer
      puts "#{project.name} is fully funded!" if project.funded?
    end
  end
end
