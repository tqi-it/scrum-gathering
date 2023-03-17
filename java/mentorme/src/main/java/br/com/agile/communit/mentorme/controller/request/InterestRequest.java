package br.com.agile.communit.mentorme.controller.request;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InterestRequest {
	@JsonProperty("skill_id")
    private Integer skillId;
	@JsonProperty("person_id")
    private Integer personId;
    
}
