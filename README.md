### Amy's Final Exam README
#### URLockBox

* production code: https://ak-final-assessment.herokuapp.com/login

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

#### Setup for Selenium (used for some testing)
You will need to download version 46 of Firefox [here](https://www.softexia.com/windows/web-browsers/firefox-46). If you do have it, make sure it is on version 46. Selenium does not work with all versions of Firefox, so make sure that you are using Firefox 46 or else it will potentially cause you problems. 

If you already have Firefox and it's on a version more recent than 46, the easiest way to downgrade is to uninstall Firefox then install version 46.

If you're having problems troubleshooting asynchronous actions (like DOM changes after an AJAX request), [peruse this section of Capybara's docs](https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends)

It is highly suggested that you also check out the Capybara docs and and the section on [selenium-webdriver](https://github.com/teamcapybara/capybara#selenium).
