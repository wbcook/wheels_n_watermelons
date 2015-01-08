# Run tests with rspec fundraiser_spec.rb --color
# Run ALL _spec.rb tests in the directory with rspec . --color
# This tests the fundraiser class.
require_relative 'fundraiser'

describe Fundraiser do

  before do
    @fundraiser = Fundraiser.new("Wheels and Watermelons")

    @initial_funds = 150
    @project = Project.new("watermelons", @initial_funds, 200, 30)

    @fundraiser.add_project(@project)
  end

  it "should generously fund the project two times" do
    Die.any_instance.stub(:roll).and_return(1)

    @fundraiser.collect(1)
    @project.funds.should == @initial_funds + 25 + 25
  end
  it "should skip over the project" do
    Die.any_instance.stub(:roll).and_return(3)

    @fundraiser.collect(1)
    @project.funds.should == @initial_funds
  end
  it "should fund the project one time" do
    Die.any_instance.stub(:roll).and_return(5)

    @fundraiser.collect(1)
    @project.funds.should == @initial_funds + 25
  end
end
