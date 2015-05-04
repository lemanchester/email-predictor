# Email Predictor

Given the name of a person (first and last), domain and a list of contacts,
you should predict the person email's address looking through the contacts list.


### Example:

Given name: "Casandra Sauer", domain: mydomain.com

Contacts:
{
  'John Doe'    => 'john.doe@mydomain.com',
  'Joseph Wu'   => 'joseph.wu@mydomain.com',
  'Linda Li'    => 'linda.li@mydomain.com',
  'Larry Page'  => 'larry.p@google.com',
  'Sergey Brin' => 's.brin@google.com',
  'Steve Jobs'  => 's.j@apple.com'
}

You should predict that the email is:

casandra.sauer@mydomain.com


### You should only consider these 4 patterns:

first_name_dot_last_name:       "casandra.sauer@mydomain.com"
first_name_dot_last_initial:    "cansadra.s@mydomain.com"
first_initial_dot_last_name:    "c.sauer@mydomain.com"
first_initial_dot_last_initial: "c.s@mydomain.com"

