# Simple News App - Rails Competency Test
## Requirements

* [Ruby 2.7.0p0](https://www.ruby-lang.org/en/)
* [Rails 6.0.3.4](https://rubyonrails.org/)
* [Node.js 10.13.0](http://nodejs.org/)
* [Yarn 1.22.4](https://yarnpkg.com/)

## Installation Steps

1. Clone repo: `git clone https://github.com/augustpuja/puja-ror-competency-test.git`
2. Change into directory: `cd puja-ror-competency-test`
3. Install gems: `bundle install`
4. Install JavaScript packages: `yarn install`
5. Setup database: `rails db:setup`
5. Start the server: `rails s`
6. Visit http://localhost:3000/ and log in with any of the users defined in the [seeds file](https://github.com/kumarbindal/kumar-ror-competency-test/blob/master/db/seeds.rb).


## User Personas
The project will have multiple roles that interact with each other.
- [ ] Guest (No Login)
- [ ] Vanilla Users (Logged in - No special role)
- [ ] Editor Users
- [ ] Admin Users *(Extra Credit)*

## User Functionality
##### Guests (No Login)
- [ ] Can see homepage with first 3 articles from each category.
- [ ] Can see article index page.
- [ ] Are sent to login/signup page if they want to see article show page.
  - [ ] Signup form can be included on the login page or just linked to from the login page.
- [ ] Can signup
- [ ] Can Login

##### Vanilla Users
- [ ] Can see everything a guest can
- [ ] Can see article show pages. 
- [ ] Can logout

##### Editor Users
- [ ] Can do everything a vanilla User can.
- [ ] Can create articles
- [ ] Can delete articles that they created
- [ ] Can edit articles that they created
- [ ] Can NOT delete or edit articles created by others

##### Admin User *(Extra Credit)*
- [ ] Can create users and set roles.
- [ ] Can edit users and change roles.
- [ ] Can't edit/destroy/create articles.

## Article Table
- [ ] Table will contain **title**, **content**, **category**, **user_id**.

## Roles
- [ ] Use one of these gems: Petergate *(Preferred)*, Pundit, Cancancan, Rolify.
###### Role Names
- [ ] user
- [ ] editor
- [ ] admin *(Extra Credit)*

## Database
- [ ] Use sqlite

## Testing
- [ ] Use minitest as the test suite. 

## Authentication
- [ ] Devise can be used for authentication.

## Templating
- [ ] slim *(Prefered)*, haml, erb