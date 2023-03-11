package br.com.agile.communit.mentorme.model;

import javax.persistence.*;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "contact")
public class Contact {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="contact_sequence")
	@SequenceGenerator(name="contact_sequence", sequenceName="contact_sequence", allocationSize = 1)
	private Integer id;
	
	@ManyToOne
    @JoinColumn(name = "id_contact_type", referencedColumnName = "id", columnDefinition = "id_contact_type")
	private ContactType type;
    
	@ManyToOne
	@JoinColumn(name = "id_person", referencedColumnName = "id", columnDefinition = "id_person")
	private Person person;
	
	@Column(name = "contact_value")
	private String value;

}
