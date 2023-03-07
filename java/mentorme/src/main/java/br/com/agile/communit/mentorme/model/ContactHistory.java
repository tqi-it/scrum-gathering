package br.com.agile.communit.mentorme.model;

import java.sql.Date;

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
@Table(name = "contact_history")
public class ContactHistory {

	@Id
    @Column(name = "id", nullable = false)
	@GeneratedValue( strategy=GenerationType.AUTO )
	private Integer id;
	
	@ManyToOne
    @JoinColumn(name = "id_person_from", referencedColumnName = "id", columnDefinition = "id_person_from")
	private Person from;
    
	@ManyToOne
    @JoinColumn(name = "id_person_to", referencedColumnName = "id", columnDefinition = "id_person_to")
	private Person to;
	
    @Column(name = "created", nullable = false)
	private Date when;
    
    @Column(name = "request_type", nullable = false)
    @Enumerated(EnumType.STRING)
    private RequestType requestType;

    @Column(name = "contact_value")
    private String contactValue;

    @Column(name = "contact_type")
    private String contactType;
	
}
