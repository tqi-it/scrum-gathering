package br.com.agile.communit.mentorme.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.ContactHistory;

@Repository
public interface ContactHistoryRepository extends JpaRepository<ContactHistory, Integer> {

}
