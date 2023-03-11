package br.com.agile.communit.mentorme.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "person")
public class Person {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="person_sequence")
	@SequenceGenerator(name="person_sequence", sequenceName="person_sequence", allocationSize = 1)
	private Integer id;

	@Column(name = "name")
	private String name;
	
    @Column(name = "mini_bio")
	private String miniBio;
	
    @Column(name = "can_teach")
	private boolean canTeach;
	
    @Column(name = "want_to_learn")
	private boolean wantToLearn;

	@Column(name = "image_url")
	private String imageUrl;

	@Column(name = "active")
	private boolean active;

}
