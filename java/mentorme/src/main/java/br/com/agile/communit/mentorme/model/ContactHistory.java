package br.com.agile.communit.mentorme.model;


import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import br.com.agile.communit.mentorme.enums.RequestType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "contact_history")
public class ContactHistory {

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="contact_history_sequence")
    @SequenceGenerator(name="contact_history_sequence", sequenceName="contact_history_sequence", allocationSize = 1)
	private Integer id;

	@ManyToOne
    @JoinColumn(name = "id_person_to", referencedColumnName = "id", columnDefinition = "id_person_to")
	private Person to;
	
    @Column(name = "created", nullable = false)
	private LocalDateTime when;
    
    @Column(name = "request_type", nullable = false)
    @Enumerated(EnumType.STRING)
    private RequestType requestType;

    @Column(name = "contact_value")
    private String contactValue;

    @Column(name = "contact_type")
    private String contactType;
	
}
