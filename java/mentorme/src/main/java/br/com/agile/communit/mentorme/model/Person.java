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
@Table(name = "PERSON")
public class Person {
	
	@Id
    @Column(name = "ID", nullable = false)
	@GeneratedValue( strategy=GenerationType.AUTO )
	private Integer id;
	
    @Column(name = "MINI_BIO")
	private String miniBio;
	
    @Column(name = "CAN_TEACH")
	private boolean canTeach;
	
    @Column(name = "WANT_TO_LEARN")
	private boolean wantToLearn;
	
}
