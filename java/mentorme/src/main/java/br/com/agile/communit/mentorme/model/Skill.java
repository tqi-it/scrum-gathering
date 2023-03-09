package br.com.agile.communit.mentorme.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "skill")
public class Skill {
	
	@Id
    @Column(name = "id", nullable = false)
	@GeneratedValue( strategy=GenerationType.AUTO )
	private Integer id;
	
    @Column(name = "description")
	private String description;
	
    @Column(name = "label")
	private boolean label;

}
