###
# funding_round.rb is responsibile for collecting funds for a fundraiser.
###
require_relative 'die'
require_relative 'fundraiser'
require_relative 'pledge_pool'

module FundingRound
  def self.funding_round(project)
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
    pledge = PledgePool.random
    puts "#{project.name} got a #{pledge.name} pledge worth #{pledge.amount} dollars."
  end
end
