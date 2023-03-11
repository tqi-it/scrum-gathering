package br.com.agile.communit.mentorme.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import br.com.agile.communit.mentorme.model.Skill;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class SkillRequest {
	
	
	@JsonProperty("id")
	private Integer id;
	@JsonProperty("name")
	private String name;
	@JsonProperty("description")
	private String description;
	
	public static Skill toEntity(SkillRequest skill) {
		return Skill.builder().id(skill.id).label(skill.name).description(skill.getDescription())
				.build();
	}

}
