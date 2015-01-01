# A fundraising app that tracks the funding of various odd projects. Now with encapsulation
# and a Fundraising class to manage lists of proejects and their collections.
require_relative 'project'
require_relative 'die'

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
      die = Die.new
      case die.roll
      when 1..2
        project.loan
        project.loan
      when 2..3
        puts "#{project.name} was skipped!"
      else
        project.loan
      end
      project.expirer
      puts "#{project.name} is fully funded!" if project.funded?
    end
  end
end
