[![Build Status](https://travis-ci.com/aravind666/mutants-of-ruby.svg?branch=master)](https://travis-ci.com/aravind666/mutants-of-ruby)

#  Mutation Analyis in Ruby


A simple ruby application built to demonstrate gathering of coverage and mutation analysis reports

This application was built on Ruby 2.6.5 version, make sure you have it in your system before you run. 

It is a simple Restaurant finder application, to experiance the application by running its features

This app has Travis CI build pipeline configured with gates (tests, coverage, standards, duplicates).

### To run the application
```
bundle install // to install all the required dependencies 

ruby init.rb // initialize and run the application
```

### It has rake tasks defined for ensuring clean code 

```
rake coverage              # Gather Code coverage 
rake jscpd                 # Identify Duplicate lines in the code
rake rubocop               # Run RuboCop for ensuring coding standards
rake rubocop:auto_correct  # Auto-correct RuboCop offenses
rake spec                  # Run tests 
```

### To run mutation analysis run
```
bundle exec mutant --use rspec -I lib/ -r restaurant Restaurant
```

### Todo 

1. Define rake tasks to run mutation analysis
2. Gate for mutation analysis

## Before creating your Pull request 

Make sure you run the below rake task at your local environment to ensure that you are meeting our standards 

```
rake travis:run            # Executing Defined Gates
```



