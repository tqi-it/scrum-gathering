package br.com.agile.communit.mentorme.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ContactHistoryRequest {

	@JsonProperty("person_to")
	private Integer personTo;
	@JsonProperty("contact_value")
	private String contactValue;
	@JsonProperty("contact_type")
	private String contactType;

	private boolean mentor;
}
