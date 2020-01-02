[![Build Status](https://travis-ci.com/aravind666/mutants-of-ruby.svg?branch=master)](https://travis-ci.com/aravind666/mutants-of-ruby)


[![Code Climate](https://codeclimate.com/github/aravind666/mutants-of-ruby.png)](https://codeclimate.com/github/aravind666/mutants-of-ruby)

#  Mutation Analyis in Ruby

A simple ruby application built to demonstrate gathering of coverage, mutation analysis reports and using JSCPD to detect duplicate/similar code

It is a simple Restaurant finder application, it allows you to add, list, search for a restaurant 

This app has Travis CI build pipeline configured with gates (tests, coverage, standards, duplicates and mutation analysis).

### To run the application

This application was built on Ruby 2.5.3 version, make sure you have it in your system before you run.  Since the intention of building this is also to demonstrate JSCPD you need nodejs 12.13 installed in your machine 

```
npm install -g jscpd // Install JSCPD commandline tool

gem install bundler:1.17.2  // Install bunder 

bundle install // to install all the required dependencies 

ruby init.rb // initialize and run the application

rake -T // List rake tasks


```

### To run this application within a Docker container 

This is for those people who are interested in doing things in a state of the art way :) . I have created a Docker image which comes with all required dependencies pre installed. The only thing you have to install in your local machine is Docker Engine based on the class of operating system you are using ( follow the instructions in https://docs.docker.com/install/ ). 

Once you have Docker engine installed in your system just spin up a container by sharing the source with the container . Follow the steps below to achive that

1. clone the repository 
2. Navigate in to the cloned repository folder
3. Run the below command 

```

docker run -ti -v /path/to/sourcecode/in/your/system:/usr/src aravind666/mutants-on-ruby:latest bash
```

Once you are in the container, navigate to /usr/src and run 

```
bundle install // to install all the required dependencies 

ruby init.rb // initialize and run the application 

rake -T // List rake tasks
```

I have even added Dockerfile in this repository, which has the steps expressed to build this image, you are always free to change it for your comfort and build an image and spin up a container of your own image.


### It has rake tasks defined for ensuring clean code 

```
rake coverage              # Gather Code coverage 
rake jscpd                 # Identify Duplicate lines in the code
rake rubocop               # Run RuboCop for ensuring coding standards
rake rubocop:auto_correct  # Auto-correct RuboCop offenses
rake spec                  # Run tests 
rake mutantation_analysis  # Perform Mutation Analysis On Domain Logic
```

### TODO 

Curently I am just performing mutation analysis as part of build
We have to fail the build if mutation coverage is less than 90% 

## Before creating your Pull request 

Make sure you run the below rake task at your local environment to ensure that you are meeting our standards 

```
rake travis:run            # Executing Defined Gates
```

The rake task travis:run is the same task which is run in our Travis CI/CD pipeline to evaluate the build. 




