package br.com.agile.communit.mentorme.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ContactRequest {
	@JsonProperty
	private String value;
	@JsonProperty
	private String type;

}
