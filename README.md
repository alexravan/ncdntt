# comp120-spring2016-team10

Comp 120 Spring 2016

Team 10 -- Mateo, Alex, Jacob

1/31/16

## Schema Design Rationale

We chose to make a table of users with first name, last name, and contact info with a unique
ID as the primary key. In this way we can quicly access user data by their ID and name. We also
have their department and permissions, which links to a table called "user_permissions."

User_permissions links users to any amount of permissions set in the "permissions" table, like 
in class with roles, people, and people's roles, to allow users to have multiple permissions
within the organization based on their roles at the institution. 

We have two tables for tickets that require all of the relevant information for tickets,
one for closed and one for open tickets. These tables lin to IDs of tickets in the table
that contains all tickets. This will allow for fast closing and reopening of tickets,
as well as the fast population of the Timeline -- we will only have to go through 
open tickets and not all tickets, which saves time as the app's life grows longer and
more tickets become closed.

In addition, all tickets have a field for category, which link with an ID to a table with a 
list of categories -- such as "Fire" or "Chemical Spill." 


## Wireframe Design Rationale

User friendly, allows easy access to important personal user data (history of ticket submissions), and 
clearly highlights required data fields for ticket submissions. 

Timeline sorts incidents by severity.
