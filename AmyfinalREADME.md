### Amy's Final Exam README


* Rails version: 5.0.1

* System dependencies: This app requires postgresql as a database. All other gem dependencies are listed in the Gemfile and can be downloaded by running `bundle` from your terminal.

* General Configuration: clone down this repo, `bundle` to ensure all the Gemfile dependencies are loaded on your local computer, and then you will need to setup the database.

* Database Configuration: once you have cloned the repo and bundled for gems, you will have to set up the database on your local machine. To do this, please run the following commands from your terminal in order:
<br>
rake db:create (this will create the postgresql database needed to run the project)  
rake db:migrate (this will load all the database tables with the information specified in the migration files)  
rake db:test:prepare (this will ensure that you can run the test specs)  

* How to run the test suite: once you have set up the database, you can run the test specs by simply typing `rspec` into the terminal. 

* How to run the program from your local browser: if you would like to run the app from your browser, please type `puma` or `rails server` into the terminal and then open up a browser of your choice and type in the following basic URL `localhost:3000/`. You will need to login or sign up in order to use the app, which can be done from the root page (which will redirect you to the login page). Once you are logged in, you can begin submitting links to the site and storing them. 
