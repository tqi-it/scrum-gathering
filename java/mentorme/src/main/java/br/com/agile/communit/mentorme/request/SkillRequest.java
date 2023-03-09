package br.com.agile.communit.mentorme.request;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SkillRequest {
	@JsonProperty("id")
    private Integer id;
    @JsonProperty("name")
    private String name;
    @JsonProperty("description")
    private String description;
    List<SkillRequest> skillsToLearn;
    List<SkillRequest> skillsToTeach;
    
}
