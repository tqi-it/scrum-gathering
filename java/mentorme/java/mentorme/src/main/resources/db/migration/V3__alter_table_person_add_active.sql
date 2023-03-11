ALTER TABLE person ADD COLUMN active BOOLEAN;

update person set active = true where 1 = 1;