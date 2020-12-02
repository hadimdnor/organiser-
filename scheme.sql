CREATE TABLE members (id SERIAL PRIMARY KEY, name TEXT, email TEXT, password TEXT);

CREATE TABLE to_do (id SERIAL PRIMARY KEY, date TEXT, completion_date TEXT, task TEXT);

CREATE TABLE social_network (id SERIAL PRIMARY KEY, page_name TEXT, page_url TEXT, email_used TEXT, password_hint TEXT);

CREATE TABLE quote (id SERIAL PRIMARY KEY, date TEXT , life_quote TEXT, image TEXT);           

CREATE TABLE financial (id SERIAL PRIMARY KEY, date TEXT, month TEXT, monthly_budget INTEGER , daily_budget INTEGER, expanses INTEGER, utility_bill INTEGER, banking_information INTEGER);                                             

CREATE TABLE family( id SERIAL PRIMARY KEY, name TEXT, relationship TEXT, birth_date INTEGER, address TEXT, contact_num INTEGER, picture TEXT);

              List of relations
 Schema |      Name      | Type  |   Owner
--------+----------------+-------+-----------
 public | family         | table | hadimdnor
 public | financial      | table | hadimdnor
 public | members        | table | hadimdnor
 public | quote          | table | hadimdnor
 public | social_network | table | hadimdnor
 public | to_do          | table | hadimdnor
(6 rows)

