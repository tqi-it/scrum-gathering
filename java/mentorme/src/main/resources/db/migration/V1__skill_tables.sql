CREATE TABLE skill (
   id bigint PRIMARY KEY,
   description TEXT NOT NULL,
   label VARCHAR(20) NOT NULL
);

CREATE TABLE skill_to_learn (
   id bigint PRIMARY KEY,
   id_person bigint NOT NULL,
   id_skill bigint NOT NULL,
   CONSTRAINT fk_skill_to_learn_person FOREIGN KEY(id_person) REFERENCES person(id),
   CONSTRAINT fk_skill_to_learn_skill FOREIGN KEY(id_skill) REFERENCES skill(id)
);

CREATE TABLE skill_to_teach (
   id bigint PRIMARY KEY,
   id_person bigint NOT NULL,
   id_skill bigint NOT NULL,
   CONSTRAINT fk_skill_to_teach_person FOREIGN KEY(id_person) REFERENCES person(id),
   CONSTRAINT fk_skill_to_teach_skill FOREIGN KEY(id_skill) REFERENCES skill(id)
);