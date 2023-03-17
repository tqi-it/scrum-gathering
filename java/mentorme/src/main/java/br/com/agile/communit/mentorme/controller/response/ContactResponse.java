package br.com.agile.communit.mentorme.controller.response;

import br.com.agile.communit.mentorme.model.Contact;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Builder;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@Builder
public class ContactResponse {
    @JsonProperty("id")
    private Integer id;
    @JsonProperty("url")
    private String value;
    @JsonProperty("type")
    private String type;

    public static ContactResponse toResponse(Contact contact) {
        return ContactResponse.builder()
                .id(contact.getId())
                .value(contact.getValue())
                .type(contact.getType().getType())
                .build();
    }
}
