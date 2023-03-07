package br.com.agile.communit.mentorme.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import br.com.agile.communit.mentorme.model.Person;
import lombok.Builder;
import lombok.Data;
import org.springframework.util.CollectionUtils;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@Builder
public class PersonResponse {
    @JsonProperty("image")
    private String image;
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
    private String phoneNumber;


    public static PersonResponse entityToResponse(Person entity) {
        return PersonResponse.builder()
                .id(entity.getId())
                .image(entity.getImageUrl())
                .canTeach(entity.isCanTeach())
                .description(entity.getMiniBio())
                .name(entity.getName())
                .wantToLearn(entity.isWantToLearn())
                //.phoneNumber(CollectionUtils.isEmpty(entity.getContacts()) ? "" : entity.getContacts().get(0).getValue())
                .build();
    }
}
