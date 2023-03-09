package br.com.agile.communit.mentorme.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import br.com.agile.communit.mentorme.model.Person;
import br.com.agile.communit.mentorme.repository.PersonRepository;
import br.com.agile.communit.mentorme.request.PersonRequest;
import br.com.agile.communit.mentorme.response.PersonResponse;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PersonService {

    private final PersonRepository personRepository;

    public List<PersonResponse> listMentor() {
        return personRepository.findByCanTeach(true).orElse(new ArrayList<>())
                .stream().map(PersonResponse::entityToResponse)
                .collect(Collectors.toList());
    }
    
    public List<PersonResponse> listMentored() {
        return personRepository.findByWantToLearn(true).orElse(new ArrayList<>())
                .stream().map(PersonResponse::entityToResponse)
                .collect(Collectors.toList());
    }
    
    public PersonResponse save(PersonRequest personRequest) {
    	Person person = personRepository.save(PersonRequest.requestToEntity(personRequest));
    	
    	return PersonResponse.entityToResponse(person);
    }
}
