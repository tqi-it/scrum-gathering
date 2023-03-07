package br.com.agile.communit.mentorme.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ContactHistoryRequest {

	@JsonProperty
	private PersonRequest from;
	@JsonProperty
	private PersonRequest to;
	@JsonProperty
	private String contactValue;
	@JsonProperty
	private String contactType;

}
