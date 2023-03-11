package br.com.agile.communit.mentorme.service;

import br.com.agile.communit.mentorme.model.Contact;
import br.com.agile.communit.mentorme.repository.ContactRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ContactService {

    private final ContactRepository contactRepository;

    public List<Contact> findAll() {
        return contactRepository.findAll();
    }
}
