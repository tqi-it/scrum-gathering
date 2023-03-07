package br.com.agile.communit.mentorme.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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
@Table(name = "CONTACT")
public class Contact {
	
	@Id
    @Column(name = "ID", nullable = false)
	@GeneratedValue( strategy=GenerationType.AUTO )
	private Integer id;
	
	@OneToOne
    @Column(name = "CONTACT_TYPE", nullable = false)
	private ContactType type;
    
	@ManyToOne
    @Column(name = "ID_PERSON", nullable = false)
	private Person person;
	
	

}
