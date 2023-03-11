package br.com.agile.communit.mentorme.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "skill")
public class Skill {
	
	@Id
    @Column(name = "id", nullable = false)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="skill_sequence")
	@SequenceGenerator(name="skill_sequence", sequenceName="skill_sequence", allocationSize = 1)
	private Integer id;
	
    @Column(name = "description")
	private String description;
	
    @Column(name = "label")
	private String label;

}
