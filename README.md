
Given the name, domain and a list of contacts, you should predict which is the email of the person.

"Filipe Costa", stackbuilders.com

{
  'John Doe' => 'john.doe@stackbuilders.com',
  'Joseph Wu' => 'joseph.wu@stackbuilders.com',
  'Linda Li' => 'linda.li@stackbuilders.com',
  'Larry Page' => 'larry.p@google.com',
  'Sergey Brin' => 's.brin@google.com',
  'Steve Jobs' => 's.j@apple.com'
}


You should only consider these 4 patterns:

first_name_dot_last_name: "filipe.costa@stackbuilders.com"
first_name_dot_last_initial: "filipe.c@stackbuilders.com"
first_initial_dot_last_name: "f.costa@stackbuilders.com"
first_initial_dot_last_initial: "f.c@stackbuilders.com"

