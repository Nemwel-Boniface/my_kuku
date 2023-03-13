# My Kuku

As a small-scale farmer of chicken, I have always struggled to keep track of my flock. Now, as a software developer, I have an advantage and I am challenging myself to build a system that will help me manage my flock by leveraging the advantages that tech has to offer. This will also be a neater, faster, and more automated process that will make the process of data storage of poultry details and retrieval faster.

With the software, you will be able to track a chicken from the time it is a chick all the way to when it is a fully grown chicken and become a rooster and provide meat or a hen and provide eggs and also count the number of eggs it will have laid throughout its lifetime.

You will be able to create a "collection" having groups such as local (Kienyeji) or broiler chicken. Kuku is Swahili for chicken.

This application will help me practice:
1. The REST framework by creating CRUD API endpoint for adding, deleting updating data
2. Writing integrated unit tests using the [Rspec](https://rspec.info/) library for unit tests for my API end points.
3. API documentation using the [Rswag](https://github.com/rswag/rswag) library to document the endpoint for my API application.
4. The Ruby on Rails [MVC](https://www.bogotobogo.com/RubyOnRails/RubyOnRails_Model_View_Controller_MVC.php). Technically just the Models and controllers as this is an API application there will be no view here but the view will be an external application.
5. Project documentation by writing a detailed README upon completion to help anyone who might be interested with my project
6. Project deployment making use of [render](https://render.com/) which will host my API application.


Enjoy!


# Built With
 - Ruby on Rails
 - PostgreSQL
 - Test-driven development


# Additional Tools
  1. Rubocop
  2. Ruby Gems

# Getting Started
To get local copy of the project and run

1. ``git clone git@github.com:Nemwel-Boniface/my_kuku.git``
2. ``cd my_kuku`
3. ``gem install bundler``
4. ``bundle install``
5. ``rails s``

## Database Setup
Setup db

1. ``su - postgres``
2. ``psql``
3. ``create role nemwel with createdb login password 'root'``
4. ``rails db:setup``
5. ``rails db:create``
6. ``rails db:seed``

# Tests

1. ``bundle exec rspec``
2. ``rubocop``

### Run your tests

1. ``rake``
2. ``rspec``

### To run rubocop we use:

1. `rubocop`

### To autocorrect offenses with rubocop we use:
1. `rubocop --auto-correct-all` or
2. `rubocop -A`

Have fun with TDD!

## Authors

👤 **Nemwel Boniface**

- GitHub: [@Nemwel Boniface](https://github.com/Nemwel-Boniface)
- Twitter: [@Nemwel Boniface](https://twitter.com/nemwel_bonie)
- LinkedIn: [@Nemwel Bonifacej](https://www.linkedin.com/in/nemwel-nyandoro/)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Nemwel-Boniface/my_kuku/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
- Anyone whose code will be used

## 📝 License

This project is [MIT](./MIT.md) licensed.