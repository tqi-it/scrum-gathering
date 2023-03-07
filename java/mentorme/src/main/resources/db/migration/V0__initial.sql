CREATE TABLE person (
   id bigint PRIMARY KEY,
   name varchar(255) NOT NULL,
   mini_bio TEXT NOT NULL,
   can_teach BOOLEAN,
   want_to_learn BOOLEAN
);