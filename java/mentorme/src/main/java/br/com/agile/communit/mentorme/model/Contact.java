package br.com.agile.communit.mentorme.model;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "contact")
public class Contact {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="contact_sequence")
	@SequenceGenerator(name="contact_sequence", sequenceName="contact_sequence", allocationSize = 1)
	private Integer id;
	
	@OneToOne
    @JoinColumn(name = "id_type", referencedColumnName = "id", columnDefinition = "id_type")
	private ContactType type;
    
	@ManyToOne
	@JoinColumn(name = "id_person", referencedColumnName = "id", columnDefinition = "id_person")
	private Person person;
	
	@Column(name = "value")
	private String value;

}
