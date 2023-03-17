package br.com.agile.communit.mentorme.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.Skill;
import br.com.agile.communit.mentorme.model.SkillToLearn;

@Repository
public interface SkillToLearnRepository extends JpaRepository<SkillToLearn, Integer> {
	Optional<List<SkillToLearn>> findByPersonId(Integer personId);

	Optional<List<SkillToLearn>> findBySkillInAndPersonActive(List<Skill> skills, boolean active);
	Optional<List<SkillToLearn>> findBySkillIdInAndPersonActive(List<Integer> skillsId, boolean active);

}
