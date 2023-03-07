package br.com.agile.communit.mentorme.service;

import br.com.agile.communit.mentorme.response.PersonResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class PersonService {

    public List<PersonResponse> listMentor() {
        return new ArrayList<>();
    }
}
