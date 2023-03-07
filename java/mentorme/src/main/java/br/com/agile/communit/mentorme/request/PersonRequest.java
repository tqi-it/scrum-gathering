package br.com.agile.communit.mentorme.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import br.com.agile.communit.mentorme.model.Person;
import br.com.agile.communit.mentorme.response.PersonResponse;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class PersonRequest {
	
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
    
    public static Person entityToResponse(PersonRequest request) {
        return Person.builder()
                .canTeach(request.isCanTeach())
                .miniBio(request.getDescription())
                .name(request.getName())
                .wantToLearn(request.isWantToLearn())
                .build();
    }
    
}
