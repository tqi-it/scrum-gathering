package br.com.agile.communit.mentorme.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Builder;
import lombok.Data;
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@Builder
public class ContactHistoryResponse {
	
	    @JsonProperty("id")
	    private Integer id;
}
