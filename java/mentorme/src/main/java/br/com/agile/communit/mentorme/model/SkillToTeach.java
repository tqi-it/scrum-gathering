package br.com.agile.communit.mentorme.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "skill_to_teach")
public class SkillToTeach {

	@Id
    @Column(name = "id", nullable = false)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="skill_to_teach_sequence")
	@SequenceGenerator(name="skill_to_teach_sequence", sequenceName="skill_to_teach_sequence", allocationSize = 1)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "id_person", referencedColumnName = "id", columnDefinition = "id_person")
	private Person person;

	@ManyToOne
	@JoinColumn(name = "id_skill", referencedColumnName = "id", columnDefinition = "id_skill")
	private Skill skill;
	
}
