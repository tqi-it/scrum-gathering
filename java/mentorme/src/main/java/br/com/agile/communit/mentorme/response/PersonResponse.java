package br.com.agile.communit.mentorme.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class PersonResponse {
    @JsonProperty("image")
    private byte[] image;
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
}
