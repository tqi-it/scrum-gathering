package br.com.agile.communit.mentorme.model;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
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

}
