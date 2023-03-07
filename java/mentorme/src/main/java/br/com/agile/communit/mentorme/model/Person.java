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
@Table(name = "person")
public class Person {
	
	@Id
    @Column(name = "id", nullable = false)
	@GeneratedValue( strategy=GenerationType.AUTO )
	private Integer id;

	@Column(name = "name")
	private String name;
	
    @Column(name = "mini_bio")
	private String miniBio;
	
    @Column(name = "can_teach")
	private boolean canTeach;
	
    @Column(name = "want_to_learn")
	private boolean wantToLearn;
	
}
