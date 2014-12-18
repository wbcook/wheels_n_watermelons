# A fundraising app that tracks the funding of various odd projects. Now with encapsulation
# and a Fundraising class to manage lists of proejects and their collections.
require_relative 'project'
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
      project.loan
      project.expirer
    end
    @projects.each do |project|
      puts project unless project.difference <= 0
      puts "#{project.name} is fully funded with $#{project.funds}, hooray!" if project.difference <= 0
    end
    puts "#{@title}".center(45, '*')
  end
end
