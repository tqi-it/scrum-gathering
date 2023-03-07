package br.com.agile.communit.mentorme.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
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
@Table(name = "CONTACT_HISTORY")
public class ContactHistory {

	@Id
    @Column(name = "ID", nullable = false)
	@GeneratedValue( strategy=GenerationType.AUTO )
	private Integer id;
	
	@ManyToOne
    @Column(name = "FROM", nullable = false)
	private Person from;
    
	@ManyToOne
    @Column(name = "TO", nullable = false)
	private Person to;
	
    @Column(name = "WHEN", nullable = false)
	private Date when;
    
    @Column(name = "REQUEST_TYPE", nullable = false)
    private RequestType requestType;
    
    @Column(name = "CONTACT_VALUE")
    private String value;
	
}
