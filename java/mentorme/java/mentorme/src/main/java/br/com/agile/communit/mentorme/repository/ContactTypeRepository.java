package br.com.agile.communit.mentorme.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.ContactType;

import java.util.Optional;

@Repository
public interface ContactTypeRepository extends JpaRepository<ContactType, Integer> {
    Optional<ContactType> findByType(String type);

}
