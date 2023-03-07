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
@Table(name = "SKILL")
public class Skill {
	
	@Id
    @Column(name = "ID", nullable = false)
	@GeneratedValue( strategy=GenerationType.AUTO )
	private Integer id;
	
    @Column(name = "DESCRIPTION")
	private String description;
	
    @Column(name = "LABEL")
	private boolean label;

}
