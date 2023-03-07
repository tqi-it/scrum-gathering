package br.com.agile.communit.mentorme.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.Person;

import java.util.List;
import java.util.Optional;

@Repository
public interface PersonRepository extends JpaRepository<Person, Integer>{
    Optional<List<Person>> findByCanTeach(boolean canTeach);

}