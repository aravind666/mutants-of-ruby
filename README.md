[![Build Status](https://travis-ci.com/aravind666/mutants-of-ruby.svg?branch=master)](https://travis-ci.com/aravind666/mutants-of-ruby)

#  Mutation Analyis in Ruby


A simple ruby application built to demonstrate gathering of coverage and mutation analysis reports

This application was built on Ruby 2.6.5 version, make sure you have it in your system before you run. 

It is a simple Restaurant finder application, to experiance the application by running its features

### To run
```
bundle install // to install all the required dependencies 

ruby init.rb // initialize and run the application
```

### To run tests 
```
rspec 
```

### To run mutation analysis run
```
bundle exec mutant --use rspec -I lib/ -r restaurant Restaurant
```

### To check for duplicates you can use JSCPD 

```
jscpd . --min-tokens 13 --reporters 'json,html,verbose' --blame true --output . --ignore "coverage,jscpd-report.*, *.md"
```

When we ran for 13 tokens it has zero duplicates report is available in the repository (jscpd-report.html)

### Todo 

1. Define rake tasks to run/tests/mutation etc .... 
2. Integrate Rubocop to guard against code style violations



