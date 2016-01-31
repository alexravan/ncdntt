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

We have a single table for ticets that requires all of the relevant information for tickets,
and also required booleans for "isclosed" so we can easily query our DB for a list
of open tickets, and populate our page with them.


## Wireframe Design Rationale

User friendly, allows easy access to important personal user data (history of ticket submissions), and 
clearly highlights required data fields for ticket submissions. 

Timeline sorts incidents by severity.
