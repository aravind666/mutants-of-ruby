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