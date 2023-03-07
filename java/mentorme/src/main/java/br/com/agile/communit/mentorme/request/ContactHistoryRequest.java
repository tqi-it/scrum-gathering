package br.com.agile.communit.mentorme.request;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class ContactHistoryRequest {

	@JsonProperty("person_from")
	private Integer personFrom;
	@JsonProperty("person_to")
	private Integer personTo;
	@JsonProperty
	private String contactValue;
	@JsonProperty
	private String contactType;

}
