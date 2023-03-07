package br.com.agile.communit.mentorme.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
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
