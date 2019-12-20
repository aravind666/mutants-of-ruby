require 'mutant'

desc 'Perform Mutation Analysis On Domain Logic'
task :mutantation_analysis do
  require 'bundler/setup' # This line is new
  result = Mutant::CLI.run %w(--use rspec -I lib/ -r restaurant Restaurant)
end
