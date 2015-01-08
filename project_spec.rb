# Test examples for our Project class
# Don't forget to run using rspec project_spec.rb --color
require_relative 'project'

describe Project do
  before do
    $stdout = StringIO.new
    @initial_funds = 150
    @initial_goal = 200
    @initial_expire = 25
    @project = Project.new("watermelons", @initial_funds, @initial_goal, @initial_expire)
  end
  it "has a capitalized name" do
    
    @project.name.should == "Watermelons"
  end
  it "has an intitial fund" do

    @project.funds.should == 150
  end
  it "has a string representation" do

    @project.to_s.should == "#{ @project.name } has $#{ @initial_funds }, $#{@project.difference} to go, and expires in #{ @project.expire } days."
  end
  it "computes the difference of a fund and a goal" do

    @project.difference.should == 50
  end
  it "adds money to a fund" do

    @project.loan
    @project.funds.should == @initial_funds + 25
  end
  it "counts down the days until a loan expires" do

    @project.expirer
    @project.expire.should == @initial_expire - 1
  end
  context "in a collection of projects" do
    before do
      @project1 = Project.new("wheels", 100, 200, 30)
      @project2 = Project.new("watermelons", 125, 200, 30)
      @project3 = Project.new("cattle", 150, 200, 30)

      @projects = [@project1, @project2, @project3]
    end

    it "is sorted by decreasing funding" do
      @projects.sort.should == [@project3, @project2, @project1]
    end
  end
end
