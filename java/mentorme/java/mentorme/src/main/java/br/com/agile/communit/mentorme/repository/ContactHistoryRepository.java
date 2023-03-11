package br.com.agile.communit.mentorme.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.ContactHistory;

@Repository
public interface ContactHistoryRepository extends JpaRepository<ContactHistory, Integer> {

    @Query(value = "select count(id_person_to) from contact_history where id_person_to = :personId", nativeQuery = true)
    Long countContactsTo(@Param("personId") Integer personId);

}
