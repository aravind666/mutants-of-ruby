require 'json'
# For some reason JSCPD is not respecting the config json file in travis so running the command with cli options
desc "JSCPD task for token size 13"
task :jscpd do
  puts(`jscpd . --min-tokens 13 --reporters 'json,html,console' --blame true --ignore "coverage,jscpd-reports,config,*.yml, *.md"
`)
  file = File.open('report/jscpd-report.json')
  jscpd_json = JSON.parse(file.read)
  duplicate_lines = jscpd_json['statistics']['total']['duplicatedLines'].to_i
  puts duplicate_lines
  raise " #{duplicate_lines} Duplicate lines exist " if duplicate_lines > 0
end