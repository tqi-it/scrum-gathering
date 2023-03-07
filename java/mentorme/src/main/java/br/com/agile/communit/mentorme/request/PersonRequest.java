package br.com.agile.communit.mentorme.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import br.com.agile.communit.mentorme.model.Person;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class PersonRequest {
	
	@JsonProperty("id")
    private Integer id;
	@JsonProperty("name")
    private String name;
    @JsonProperty("description")
    private String description;
    @JsonProperty("can_teach")
    private boolean canTeach;
    @JsonProperty("want_to_learn")
    private boolean wantToLearn;
    @JsonProperty("phoneNumber")
    private boolean phoneNumber;
    @JsonProperty("image")
    private byte[] image;
    
    public static Person requestToEntity(PersonRequest request) {
        return Person.builder()
                .id(request.id)
                .build();
    }
    
}
