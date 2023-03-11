package br.com.agile.communit.mentorme.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.Skill;

@Repository
public interface SkillRepository extends JpaRepository<Skill, Integer> {

	Optional<Skill> findByLabel(String label);
}
