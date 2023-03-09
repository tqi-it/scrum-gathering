CREATE TABLE person (
   id bigint PRIMARY KEY,
   name varchar(255) NOT NULL,
   mini_bio TEXT NOT NULL,
   can_teach BOOLEAN,
   want_to_learn BOOLEAN
);
CREATE SEQUENCE person_sequence START WITH 7 INCREMENT BY 1;

CREATE TABLE contact_type (
   id bigint PRIMARY KEY,
   type VARCHAR (10)
);
CREATE SEQUENCE contact_type_sequence START WITH 1 INCREMENT BY 1;

CREATE TABLE contact (
   id bigint PRIMARY KEY,
   id_person bigint NOT NULL,
   id_contact_type bigint NOT NULL,
   contact_value VARCHAR(150),
   CONSTRAINT fk_contact_person FOREIGN KEY(id_person) REFERENCES person(id),
   CONSTRAINT fk_contact_type FOREIGN KEY(id_contact_type) REFERENCES contact_type(id)
);
CREATE SEQUENCE contact_sequence START WITH 7 INCREMENT BY 1;

CREATE TABLE contact_history(
   id bigint PRIMARY KEY,
   id_person_to bigint NOT NULL,
   id_person_from bigint NOT NULL,
   contact_type VARCHAR(10),
   contact_value VARCHAR(150),
   created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   request_type VARCHAR(50),
   CONSTRAINT fk_hist_contact_person_to FOREIGN KEY(id_person_to) REFERENCES person(id),
   CONSTRAINT fk_hist_contact_person_from FOREIGN KEY(id_person_to) REFERENCES person(id)
);
CREATE SEQUENCE contact_history_sequence START WITH 2 INCREMENT BY 1;