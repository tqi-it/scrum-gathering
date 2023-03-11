package br.com.agile.communit.mentorme.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import br.com.agile.communit.mentorme.model.Skill;
import br.com.agile.communit.mentorme.model.SkillToLearn;
import br.com.agile.communit.mentorme.model.SkillToTeach;
import lombok.Builder;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@Builder
public class SkillResponse {
	@JsonProperty("id")
	private Integer id;
	@JsonProperty("name")
	private String name;
	@JsonProperty("description")
	private String description;

	public static SkillResponse toResponse(Skill skill) {
		return SkillResponse.builder().id(skill.getId()).name(skill.getLabel()).description(skill.getDescription())
				.build();
	}
	
	public static SkillResponse toResponse(SkillToLearn skillToLearn) {
		Skill skill = skillToLearn.getSkill();
		return SkillResponse.builder().id(skill.getId()).name(skill.getLabel()).description(skill.getDescription())
				.build();
	}
	
	public static SkillResponse toResponse(SkillToTeach skillToTeach) {
		Skill skill = skillToTeach.getSkill();
		return SkillResponse.builder().id(skill.getId()).name(skill.getLabel()).description(skill.getDescription())
				.build();
	}
	
}
