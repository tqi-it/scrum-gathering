package br.com.agile.communit.mentorme.model;


import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.*;

import lombok.*;


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
    @JoinColumn(name = "id_person_from", referencedColumnName = "id", columnDefinition = "id_person_from")
	private Person from;
    
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
