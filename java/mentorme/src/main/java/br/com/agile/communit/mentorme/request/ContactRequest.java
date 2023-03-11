package br.com.agile.communit.mentorme.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class ContactRequest {
	@JsonProperty("url")
	private String value;

	private String type;

}
