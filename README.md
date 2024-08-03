# README

1. Created new rails app
2. Created new HomeController and add index action
2. Adding new routes `root "home#index"` in `config/routes.rb`
3. Created new View home/index.html.erb
4. I add  gem `"sassc-rails"` and `"bootstrap"` to be able to use the bootsrap
5. I add gem roo `"roo", "~> 2.10.0"` to read the sheet.
6. I created new folder called "`service`" inside of `"app"` folder
7. I created a class builder where I can isolate the logic that I used to parse the sheet into html
8. By running `"rails s"` you can run the entire app and by accessing the root you can see the parse html table.
