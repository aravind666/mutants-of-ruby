
namespace :travis do

  desc "Executing Defined Gates"
  task :run do
    ["spec", "jscpd", "coverage"].each do |cmd|
      puts "Starting to run #{cmd}..."
      system("bundle exec rake #{cmd}")
      raise "#{cmd} failed!" unless $?.exitstatus == 0
    end
  end
end
