package br.com.agile.communit.mentorme.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class PersonResponse {
    @JsonProperty("image_profile")
    private byte[] imageProfile;
    private String name;
    @JsonProperty("mini_bio")
    private String miniBio;
    @JsonProperty("can_teach")
    private boolean canTeach;
    @JsonProperty("want_to_learn")
    private boolean wantToLearn;
}
