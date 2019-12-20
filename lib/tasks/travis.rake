require 'English'

namespace :travis do
  desc 'Executing Defined Gates'
  task :run do
    %w[rubocop spec coverage jscpd].each do |cmd|
      puts "Starting to run #{cmd}..."
      system("bundle exec rake #{cmd}")
      raise "#{cmd} failed!" unless $CHILD_STATUS.exitstatus.zero?
    end
  end
end
