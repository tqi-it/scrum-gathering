package br.com.agile.communit.mentorme.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.Skill;
import br.com.agile.communit.mentorme.model.SkillToTeach;

@Repository
public interface SkillToTeachRepository extends JpaRepository<SkillToTeach, Integer> {
	
	Optional<List<SkillToTeach>> findByPersonId(Integer personId);
	
	
	Optional<List<SkillToTeach>> findBySkillIn(List<Skill> skills);
}
