package br.com.agile.communit.mentorme.controller.request;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import br.com.agile.communit.mentorme.model.Person;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class PersonRequest {

    private Integer id;
    private String name;
    private String description;
    @JsonProperty("can_teach")
    private boolean canTeach;
    @JsonProperty("want_to_learn")
    private boolean wantToLearn;
    private List<ContactRequest> contacts;
    private String image;
    
    public static Person requestToEntity(PersonRequest request) {
        return Person.builder()
                .id(request.id)
                .active(true)
                .canTeach(request.isCanTeach())
                .wantToLearn(request.isWantToLearn())
                .miniBio(request.getDescription())
                .name(request.getName())
                .imageUrl(request.getImage())
                .build();
    }
    
}
