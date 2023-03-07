package br.com.agile.communit.mentorme.model;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "SKILL_TO_TEACH")
public class SkillToLearn {

	@ManyToMany
	private Person person;
	
	@ManyToMany
	private Skill skill;
	
}
