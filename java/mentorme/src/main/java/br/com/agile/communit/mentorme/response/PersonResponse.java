package br.com.agile.communit.mentorme.response;

import br.com.agile.communit.mentorme.model.Contact;
import br.com.agile.communit.mentorme.model.Person;
import br.com.agile.communit.mentorme.model.SkillToLearn;
import br.com.agile.communit.mentorme.model.SkillToTeach;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

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
    private boolean active;
    private List<ContactResponse> contacts;
    @JsonProperty("qtd_contacts")
    private Long qtdContacts;
    private List<String> skills;
    private List<String> interests;


    public static PersonResponse entityToResponse(Person entity, List<Contact> contacts, Long qtdContacts, List<SkillToTeach> skills, List<SkillToLearn> interests) {
        return PersonResponse.builder()
                .id(entity.getId())
                .active(!CollectionUtils.isEmpty(contacts) && entity.isActive())
                .image(entity.getImageUrl())
                .canTeach(entity.isCanTeach())
                .description(entity.getMiniBio())
                .name(entity.getName())
                .wantToLearn(entity.isWantToLearn())
                .contacts(contacts.stream().map(ContactResponse::toResponse).collect(Collectors.toList()))
                .qtdContacts(qtdContacts > 0 ? qtdContacts : null)
                .skills(skills.stream().map(it -> it.getSkill().getLabel()).collect(Collectors.toList()))
                .interests(interests.stream().map(it -> it.getSkill().getLabel()).collect(Collectors.toList()))
                .build();
    }
}
