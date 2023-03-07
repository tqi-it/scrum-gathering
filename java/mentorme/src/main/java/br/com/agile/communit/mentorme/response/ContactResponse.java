package br.com.agile.communit.mentorme.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class ContactResponse {
    @JsonProperty("id")
    private Integer id;
    @JsonProperty("value")
    private String value;
    @JsonProperty("type")
    private String type;
}
