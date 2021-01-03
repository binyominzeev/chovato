# chovato

Extremely simple PHP-MySQL based project management system

![Chovato in action](https://raw.githubusercontent.com/binyominzeev/chovato/main/Screenshot_2021-01-03_12-39-44.png)

# Install

- Upload content to a PHP-MySQL capable server
- Config DB connection in `login.php`
- Import `chovato.sql` to MySQL
- Add a user to table `chovato_users` (using MySQL's `PASSWORD()` function)
- Run, enjoy

# Usage, structure

- Chovato is based on projects, tickets and tags
- **Projects** are the major folders, signed by a distinctive color, which you can choose when you create them
- **Tickets** are part of the project
  - You can create a new ticket after you enter into a project
  - To a ticket you can add comments, close it or open it any time
  - Closed tickets are not showed by default. To show closed ticket, you can use the button at top right corner
- **Tags** are optional subgroups under projects
  - You can create a tag similarly to creating a project
  - You can add a new ticket under an existing tag by clicking on it, on project page
  - (This function does not seem to work currently, and also not that advanced -- sorry for that)
- Currently the buttons are in Hungarian, you can use Google Translate, or figure it out from context (at least there are not so much of them)
  - (You are welcome to translate, I will upload it)

