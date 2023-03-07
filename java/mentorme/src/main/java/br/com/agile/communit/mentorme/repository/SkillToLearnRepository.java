package br.com.agile.communit.mentorme.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.agile.communit.mentorme.model.Skill;

@Repository
public interface SkillToLearnRepository extends JpaRepository<Skill, Integer> {

}
