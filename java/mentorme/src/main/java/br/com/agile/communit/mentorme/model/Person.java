package br.com.agile.communit.mentorme.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;

import br.com.agile.communit.mentorme.request.PersonRequest;
import br.com.agile.communit.mentorme.response.PersonResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "person")
public class Person {
	
	@Id
    @Column(name = "id", nullable = false)
	@GeneratedValue( strategy=GenerationType.AUTO )
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
