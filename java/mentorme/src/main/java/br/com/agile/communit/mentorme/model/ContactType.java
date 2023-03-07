package br.com.agile.communit.mentorme.model;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "CONTACT_TYPE")
public class ContactType {
	
	@Id
    @Column(name = "ID", nullable = false)
	private Integer id;
	
	@Id
    @Column(name = "TYPE")
	private String type;

}
