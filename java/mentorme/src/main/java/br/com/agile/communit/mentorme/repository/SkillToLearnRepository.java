package br.com.agile.communit.mentorme.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.Contact;
import br.com.agile.communit.mentorme.model.Skill;
import br.com.agile.communit.mentorme.model.SkillToLearn;
import br.com.agile.communit.mentorme.model.SkillToTeach;

@Repository
public interface SkillToLearnRepository extends JpaRepository<SkillToLearn, Integer> {
	Optional<List<SkillToLearn>> findByPersonId(Integer personId);

	Optional<List<SkillToLearn>> findBySkillIn(List<Skill> skills);

}
