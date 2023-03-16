package br.com.agile.communit.mentorme.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.Person;

@Repository
public interface PersonRepository extends JpaRepository<Person, Integer>{
    Optional<List<Person>> findByCanTeachAndActiveOrderByNameAsc(boolean canTeach, boolean active);

    Optional<List<Person>> findByWantToLearnAndActiveOrderByNameAsc(boolean canTeach, boolean active);
}
