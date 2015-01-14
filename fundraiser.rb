###
# A fundraising app that tracks the funding of various odd projects. Now with 
# encapsulation,
# and a Fundraising class to manage lists of proejects and their collections.
###
require_relative 'project'
require_relative 'die'
require_relative 'funding_round'
require_relative 'pledge_pool'

class Fundraiser
  def initialize(title)
    @title = title
    @projects = []
  end

  def add_project(project)
    @projects.push(project)
  end

  def collect(rounds)
    puts @projects
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @projects.each do |project|
        FundingRound.funding_round(project)
        project.expirer
        puts "#{project.name} is fully funded!" if project.funded?
      end
    end
    print_stats
    pledges = PledgePool::PLEDGES
    puts "\nThere are #{pledges.size} pledges to be given:"
    pledges.each do |pledge|
      puts "A #{pledge.name} pledge is worth #{pledge.amount} dollars"
    end
  end

  def print_name_and_funds(project)
    puts "#{project.name} (#{project.difference} to goal)"
  end

  def print_stats
        funded_projects, funding_projects = @projects.partition { |project| project.funded? }
    puts "#\n#{@title} Statistics:"

    puts "\n#{funded_projects.size} funded projects:"
    funded_projects.each do |project|
      print_name_and_funds(project)
    end
    
    puts "\n#{funding_projects.size} funding projects:"
    funding_projects.each do |project|
      print_name_and_funds(project)
    end
    puts "\nFunding Board: "
    @projects.sort.each do |project|
      print_name_and_funds(project)
    end
  end

end
