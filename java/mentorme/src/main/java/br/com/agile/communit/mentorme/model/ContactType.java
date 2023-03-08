package br.com.agile.communit.mentorme.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "contact_type")
public class ContactType {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="contact_type_sequence")
	@SequenceGenerator(name="contact_type_sequence", sequenceName="contact_type_sequence", allocationSize = 1)
	private Integer id;

    @Column(name = "type")
	private String type;

}
