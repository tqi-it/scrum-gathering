package br.com.agile.communit.mentorme.service;

import br.com.agile.communit.mentorme.exception.NotFoundException;
import br.com.agile.communit.mentorme.repository.PersonRepository;
import br.com.agile.communit.mentorme.response.PersonResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RequiredArgsConstructor
@Service
public class PersonService {

    private final PersonRepository personRepository;

    public List<PersonResponse> listMentor() {
        return personRepository.findByCanTeach(true).orElse(new ArrayList<>())
                .stream().map(PersonResponse::entityToResponse)
                .collect(Collectors.toList());
    }
}
